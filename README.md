# node-drone
![](https://img.shields.io/docker/cloud/automated/guoxudongdocker/node-drone.svg)

用于drone构建 node环境

### Drone CI Plugin Config

`1.0.x`
```yaml
kind: pipeline
name: default

steps:
...
- name: Update OSS
  image: guoxudongdocker/node-drone
  settings:
    ACCESS_KEY_ID: 
      from_secret: ACCESS_KEY_ID
    ACCESS_KEY_SECRET: 
      from_secret: ACCESS_KEY_SECRET
  commands: 
    - ossutil cp -r dist/ oss://bucket/path --update

```