#!/bin/bash

# This script can be used to configure RH SSO in a dev/test environment with
# some test clients, roles, groups and users and connect with PAM.
#
# To use it:
#   oc cp sso-setup.sh <RHSSO_pod_name>:/home/jboss/
#   oc exec <RHSSO_pod_name> chmod a+x /home/jboss/sso-setup.sh
#   oc exec <RHSSO_pod_name> /home/jboss/sso-setup.sh labs-dev
#   oc exec <RHSSO_pod_name> rm /home/jboss/sso-setup.sh
#
# You should then be able to see the created clients, roles, groups and users in the RH SSO admin console

if [ "$#" -ne 1 ]; then
    echo "Usage: sso-setup.sh <openshift_namespace>"
    exit 1
fi

OCP_NAMESPACE=$1

PATH=$PATH:/opt/eap/bin/

MASTER_REALM_NAME=master
MASTER_REALM_USER=ssoAdmin
MASTER_REALM_PWD=password

PAM_REALM_NAME=pam
PAM_REALM_USER=pamRealmAdmin
PAM_REALM_PWD=password

AVATAR_URL_BASE=assets/avatar

declare -A user_map
user_map["GROUP_1"]="mickey,pluto"

declare -A rolegroup_map
rolegroup_map["ROLE_1"]="GROUP_1"

# Delete and recreate the PAM realm to start with a clean realm
kcadm.sh config credentials --server http://$HOSTNAME:8080/auth --realm $MASTER_REALM_NAME --user $MASTER_REALM_USER --password $MASTER_REALM_PWD
kcadm.sh delete realms/$PAM_REALM_NAME
# Create a long access token lifespan for now until SSO is done properly
kcadm.sh create realms -s realm=$PAM_REALM_NAME -s enabled=true -s accessTokenLifespan=36000
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$PAM_REALM_USER -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password $PAM_REALM_PWD
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --cclientid realm-management --rolename realm-admin

# Then login against the PAM realm and configure it
kcadm.sh config credentials --server http://$HOSTNAME:8080/auth --realm $PAM_REALM_NAME --user $PAM_REALM_USER --password $PAM_REALM_PWD

# Create a client for Business Central to connect
kcadm.sh create clients -r $PAM_REALM_NAME -s clientId=kie-bc -s protocol=openid-connect -s publicClient=false -s secret=a-secret -s rootUrl="http://business-central-rhpamcentrmon-$OCP_NAMESPACE.apps.companyxyz.emea-1.rht-labs.com"

# Create a client for Kie servers to connect
kcadm.sh create clients -r $PAM_REALM_NAME -s clientId=kie-server -s protocol=openid-connect -s publicClient=false -s secret=a-secret -s rootUrl="http://business-central-smartrouter-$OCP_NAMESPACE.apps.companyxyz.emea-1.rht-labs.com"

# Create standard PAM roles
kcadm.sh create roles -r $PAM_REALM_NAME -s name=admin
kcadm.sh create roles -r $PAM_REALM_NAME -s name=kie-server
kcadm.sh create roles -r $PAM_REALM_NAME -s name=rest-all
kcadm.sh create roles -r $PAM_REALM_NAME -s name=guest

# Add extra roles based on the rolegroup map defined above
for role in "${!rolegroup_map[@]}"; do
    kcadm.sh create roles -r $PAM_REALM_NAME -s name=$role
done

#Create PAM admin users
username=adminUser  
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password "password"
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename admin
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename kie-server
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename rest-all

username=executionUser
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password "password!"
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename kie-server
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename rest-all
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename guest

username=monitorUser
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password "password!"
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename kie-server
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename rest-all
kcadm.sh add-roles -r $PAM_REALM_NAME --uid $USERID --rolename guest

# Create users and groups based on the user and rolegroup maps
for group in "${!user_map[@]}"; do

    kcadm.sh create roles -r $PAM_REALM_NAME -s name=$group
    
    GROUPID=$(kcadm.sh create groups -r $PAM_REALM_NAME -s name=$group -i)
    

    # Add any role assignments for this group from the rolegroup map
    for role in "${!rolegroup_map[@]}"; do
        group_list=${rolegroup_map[$role]}
        export IFS=","
        for g in $group_list; do
            if [ $g = $group ]; then
                kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename $role
            fi
        done
    done

    kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename kie-server
    kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename rest-all
    kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --cclientid realm-management --rolename view-users
    kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename $group

    username_list=${user_map[$group]}

    export IFS=","
    for username in $username_list; do
        
        USERID=$(kcadm.sh get users -r pam -q username=$username | grep \"id\" | sed 's/.*\"id\" : \"\(.*\)\".*$/\1/')
        
        if [ -z "$USERID" ]; then
            USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s firstName=Hey -s lastName=$username -s attributes='{ "avatar_url": [ "'${AVATAR_URL_BASE}/${username}.png'" ] }' -s enabled=true -i)
        fi

        kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password $username
        
        kcadm.sh update users/$USERID/groups/$GROUPID -r $PAM_REALM_NAME -s userId=$USERID -s groupId=$GROUPID -n
    done
done

# Add the USERGROUP1 group 
group=USERGROUP1
kcadm.sh create roles -r $PAM_REALM_NAME -s name=$group
GROUPID=$(kcadm.sh create groups -r $PAM_REALM_NAME -s name=$group -i)
kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename kie-server
kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename rest-all
kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --cclientid realm-management --rolename view-users
kcadm.sh add-roles -r $PAM_REALM_NAME --gid $GROUPID --rolename $group

# Add some users
username=minnie
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s firstName=Minnie -s lastName=Mouse -s attributes='{ [ "avatar_url": [ "'${AVATAR_URL_BASE}/${username}.png'" ] ] }' -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password $username
kcadm.sh update users/$USERID/groups/$GROUPID -r $PAM_REALM_NAME -s userId=$USERID -s groupId=$GROUPID -n

username=daisy
USERID=$(kcadm.sh create users -r $PAM_REALM_NAME -s username=$username -s firstName=Daisy -s lastName=Duck -s attributes='{ "avatar_url": [ "'${AVATAR_URL_BASE}/${username}.png'" ] }' -s enabled=true -i)
kcadm.sh set-password -r $PAM_REALM_NAME --userid $USERID --new-password $username
kcadm.sh update users/$USERID/groups/$GROUPID -r $PAM_REALM_NAME -s userId=$USERID -s groupId=$GROUPID -n
