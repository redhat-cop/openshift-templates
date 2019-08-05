# Secrets

## Docker Registry

So that we don't have any of our secret information stored in plain text, we need to make sure that we get this encoded. It's also important to make sure that we know format some of our secrets are expecting. With our docker-cfg secret, our secret is expecting the following format

`{"auths":{"REGISTRY_URL":{"username":"USERNAME","password":"PASSWORD"}}}`

Where:
- REGISTRY_URL = the docker registry endpoint
- USERNAME = the name of the user you use to connect to your docker registry
- PASSWORD = the password for the user that you use to connect to your docker registry

