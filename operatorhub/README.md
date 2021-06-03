# OperatorHub

The below templates are used to deploy Operators from OperatorHub without having to interact with the WebUI.

To do this you would create the following in order:

1. [OperatorGroup](operatorgroup.yml)
1. [Subscription](subscription.yml)

For more details, you can see the documention [here](https://docs.openshift.com/container-platform/4.1/applications/operators/olm-adding-operators-to-cluster.html#olm-installing-operator-from-operatorhub-using-cli_olm-adding-operators-to-a-cluster).


There are also situations where you only want to work with a specific version of an operator. To avoid dealing with automatic updates, you can set your `installPlan` in your subscription to `Manual` and then utilize the installplan-approver templates located in this repository to deploy a job that will automatically approve that version of the operator (but will not proceed with any future automatic updates)
