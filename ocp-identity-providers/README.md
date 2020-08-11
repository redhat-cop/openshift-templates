# OCP4 Identity Providers

## identity-providers.j2
You can use this to support multiple OCP4 identity providers. This jinja template will require the `idp_vars` list of identity providers (htpasswd & ldap below). See official OCP4 documentation for [additional identity providers](https://docs.openshift.com/container-platform/latest/authentication/identity_providers/configuring-htpasswd-identity-provider.html).
```yaml
idp_vars:
- name: htpasswd
  mappingMethod: claim
  type: HTPasswd
  htpasswd:
    fileData:
      name: htpasswd-secret
- name: ldap
  mappingMethod: claim
  type: LDAP
  ldap:
    attributes:
      email:
      - mail
      id:
      - dn
      name:
      - displayName
      preferredUsername:
      - uid
    bindDN: uid=sa,cn=users,cn=accounts,dc=example,dc=com
    bindPassword:
      name: ldap-bind-password
    ca:
      name: ldap-ca
    insecure: false
    url: ldaps://ipa.ipa.svc.cluster.local:389
```

## htpasswd.yml
An openshift template to create a htpasswd identity provider

## ldap.yml
An openshift template to create a ldap identity provider
