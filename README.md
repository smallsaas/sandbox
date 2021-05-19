## 用于开发环境的快速部署方案

#### 已构建`dist`, 一健部署
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/dist-run.sh | sh 
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
