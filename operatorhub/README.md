# OperatorHub

The below templates are used to deploy Operators from OperatorHub without having to interact with the WebUI.

To do this you would create the following in order:

- [OperatorGroup](operatorgroup.yml)
- [CatalogSourceConfig](catalogsourceconfig.yml)
- [Subscription](subscription.yml)

For more details, you can see the documention [here](https://docs.openshift.com/container-platform/4.1/applications/operators/olm-adding-operators-to-cluster.html#olm-installing-operator-from-operatorhub-using-cli_olm-adding-operators-to-a-cluster).