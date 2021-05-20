## 用于开发环境的快速部署方案

#### 一键部署`dist` 
> 脚本 [dist-run.sh](./script/dist-run.sh)
>
已构建出`dist`，在同级目录下执行以下脚本实现一键启动服务，随后可直接执行`build.sh`脚本, 或增加`-d`参数后台启动`sh build.sh -d`
>
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/dist-run.sh | sh 
```

#### 一键构建`.jar`
> 脚本 [pom-build.sh](./script/pom-build.sh)
>
源代码目录如下
```
src/
pom.xml
```
在`pom.xml`同级目录下执行以下脚本，即可构建出`-standalone.jar`执行包
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/pom-build.sh | sh 
```


#### 一键部署
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| web      | `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/web/docker-run.sh \| bash -` | [sandbox-web](https://github.com/smallsaas/sandbox-web) |
| api      | `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/api/docker-run.sh \| bash -` | [sandbox-api](https://github.com/smallsaas/sandbox-api) |
| mysql    | `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/mysql/docker-run.sh \| bash -` | [docker-compose.yml](./tag/mysql/docker-compose.yml)  |
| registry | `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/registry/docker-run.sh \| bash -` |                  |

#### 一键构建
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| build jar| `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/docker/docker-build.sh \| bash -` | 通过容器构建 -standalone.jar |
| build image| `curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/build/docker-build.sh \| bash -s <image-name>` | 通过容器构建 docker image |
