# Secrets

## dynamic-opaque-jinja.j2

You can use this to create secrets in a more dynamic way including different namespaces and multiple key/value pairs.
The template will use a dict of the following format:
```
secrets:
  ns1:
    secret1:
      key1: value1
      key2: value2
    secret2:
      key1: value1
      ...
  ns2:
    secret1:
      key1: value1
      key2: value2
      ...
```
Let's generate a secret from the above:
`ansible -i <inventory> all -m template -a "src=dynamic-opaque-jinja.j2 dest=/tmp/secret.yml" -e $secrets`
The generated secret now looks like
```yaml
---
apiVersion: v1
kind: List
items:
- apiVersion: v1
  type: Opaque
  data:
    key1: dmFsdWUy
  kind: Secret
  metadata:
    name: secret2
    namespace: ns1
- apiVersion: v1
  type: Opaque
  data:
    key2: dmFsdWUy
    key1: dmFsdWUx
  kind: Secret
  metadata:
    name: secret1
    namespace: ns1
---
apiVersion: v1
kind: List
items:
- apiVersion: v1
  type: Opaque
  data:
    key2: dmFsdWUy
    key1: dmFsdWUy
  kind: Secret
  metadata:
    name: secret1
    namespace: ns2
```

## secret-docker-cfg.yml

A way of creating a `.docker/config.json` secret where in the user is expected to precreate and base64 encode the `.docker/config.json` file.

So that we don't have any of our secret information stored in plain text, we need to make sure that we get this encoded. It's also important to make sure that we know format some of our secrets are expecting. With our docker-cfg secret, our secret is expecting the following format

`{"auths":{"REGISTRY_URL":{"username":"USERNAME","password":"PASSWORD"}}}`

Where:
- REGISTRY_URL = the docker registry endpoint
- USERNAME = the name of the user you use to connect to your docker registry
- PASSWORD = the password for the user that you use to connect to your docker registry

Once you have this string with the appropriate information, we can make sure it gets encoded appropriately by running the following:
- `echo -n {"auths":{"registry.example.com":{"username":"user1","password":"supersecretpassword"}}} | base64 -w0`

## secret-docker-cfg-string.yml

Another way of creating a `.docker/config.json` secret where in the user is epected to pass a clear text repository name and a base64 encoded USER:PASS auth string.

To create the `REPO_AUTH` input: `echo -n MY_USER:MY_PASS | base64 -w0`
