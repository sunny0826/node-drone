# node-drone
![](https://img.shields.io/docker/cloud/automated/guoxudongdocker/node-drone.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/guoxudongdocker/node-drone.svg)

用于 `drone` 构建 `node` 环境，并上传阿里云OSS

```yaml
kind: pipeline
name: {your-pipeline-name}

steps:
- name: 前端构建
  image: guoxudongdocker/node-drone
  volumes:
  - name: npm-cache   # npm 缓存挂载路径
    path: /root/.npm-cache
  commands: 
    - npm config set unsafe-perm true
    - npm config set cache /root/.npm-cache --global
    - npm install
    - npm run build

- name: 上传OSS
  image: guoxudongdocker/node-drone
  volumes:
  - name: oss   # ossconfig 文件所在路径
    path: /root
  commands: 
    - ossutil cp -r dist/ oss://{your-bucket}/{your-bucket-path}/ --update

volumes:
- name: npm-cache   # npm 缓存
  host:
    path: /tmp/cache/.npm-cache
- name: oss   # 挂载 oss 配置文件
  host:
    path: /tmp/cache/.oss

trigger:
  branch:
  - master
```