# ConfigMaps

## configmap-env-vars.j2
You can use this to create a configmap with key value pairs. This jinja template will require a dict of the following name and format:
```yaml
configmap_env_vars:
  key1: config1
  key2: config2
  key3: config3
```
Let's generate a configmap from the above:
`ansible -i <inventory> all -m template -a "src=configmap-env-vars.j2 dest=/tmp/configmap.yml" -e name=configmap-env-vars -e @/path/to/my/configmap_env_vars`
The generated configmap now looks like
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap-env-vars
data:
  key3: config3
  key2: config2
  key1: config1
```

## configmap-files.j2
You can use this to create a configmap with multiple keys/files. This jinja template will require a dict of the following name and format:
```yaml
configmap_files:
  file1.yml: |-
    # This is a comment in 'file1.yml'
    property1: blue
  file2.yml: |-
    property2: yellow
```
Let's generate a configmap from the above:
`ansible -i <inventory> all -m template -a "src=configmap-files.j2 dest=/tmp/configmap.yml" -e name=configmap-files -e @/path/to/my/configmap_files`
The generated configmap now looks like
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap-files
data:
  file1.yml: |
    # This is a comment in 'file1.yml'
    property1: blue
  file2.yml: |
    property2: yellow
```
