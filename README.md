# 用于开发环境的快速部署方案

## sandbox api
> 基于 Sandbox 的一键部署方案

#### 配置 raw.githubusercontent.com 域名IP
```
cat /etc/hosts
151.101.64.133 raw.githubusercontent.com
```
或
```
echo '151.101.64.133 raw.githubusercontent.com' >> /etc/hosts
```

#### 创建 sandbox network
> 以下服务可以独立运行，只要使用同一网络，先创建网络
```
docker network create sandbox_network
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
