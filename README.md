# 用于开发环境的快速部署方案

一键安装 `docker`

```shell
curl -sSL https://get.daocloud.io/docker | sh
curl -sSL https://get.docker.com | sudo sh
```

一键安装 `docker-comppose`

> [Github](https://github.com/docker/compose)

```shell
curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

### 一键构建安装包

| Type       | Script                                                                                | Link                               |
| :--------- | :------------------------------------------------------------------------------------ | ---------------------------------- |
| build jar  | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar.sh \| sh`  | 通过容器构建jar                    |
| build dist | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist.sh \| sh` | 通过容器构建dist                   |
| mvn build  | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-mvn.sh \| sh`  | 直接在本地通过容器 `mvn`环境构建 |

#### 一键启动

> 通过容器启动已构建的 `dist` 或 `-standalone.jar`

| Type | Script                                                                              | Link                                                  |
| :--- | :---------------------------------------------------------------------------------- | ----------------------------------------------------- |
| dist | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-dist.sh \| sh` | 直接启动 `dist`                                     |
| web  | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-web.sh \| sh ` | 直接启动 `web [src, package.json]`                  |
| jar  | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh \| sh ` | 直接启动已构建的 `-standalone.jar`,需配置数据库连接 |
|      |                                                                                     |                                                       |

### 一键构建镜像

| Type           | Script                                                                                                    | Link                                       |
| :------------- | :-------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| jar image      | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar-image.sh \| sh -s <image>`     | 通过 `jar`构建 `api`镜像               |
| dist image     | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist-image.sh \| sh -s <image>`    | 通过 `dist`构建 `web`镜像              |
| pom.xml image  | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-pom-image.sh \| sh -s <image>`     | 通过 `pom.xml`构建 `api`镜像           |
| web image      | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-image.sh \| sh -s <image>`     | 通过 `package.json`构建 `web`镜像      |
| web node image | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-dev-image.sh \| sh -s <image>` | 通过 `package.json`构建 `web node`镜像 |
|                |                                                                                                           |                                            |

#### 一键部署

| Type         | Script                                                                                    | Link                   |
| :----------- | :---------------------------------------------------------------------------------------- | ---------------------- |
| frps         | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frps.sh \| sh`           | 部署 `frps`          |
| frpc         | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frpc.sh \| sh`           | 部署 `frpc`          |
| registry     | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh`   | 部署 `registry`      |
| redis        | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-redis.sh \| sh`   | 部署 `redis`         |
| mysql        | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh`   | 部署 `mysql`         |
| api          | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-api.sh \| sh`     | 基于源代码部署 `api` |
| dist gateway | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-gateway.sh \| sh` | 基于 `dist`部署网关  |
|              |                                                                                           |                        |

## 一键构建

#### 一键构建 `.jar`

> 脚本 [build-jar.sh](./script/build-jar.sh)

源代码目录如下

```
src/
pom.xml
```

在 `pom.xml`同级目录下执行以下脚本，即可构建出 `-standalone.jar`执行包

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar.sh | sh 
```

#### 一键构建 `dist`

> 脚本 [build-dist.sh](./script/build-dist.sh)

源代码目录如下

```
public/
src/
package.json
```

在 `package.json`同级目录下执行以下脚本，即可构建出 `dist`

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist.sh | sh 
```

## 一键启动

#### 一键启动 `dist`

> 脚本 [run-dist.sh](./script/run-dist.sh)

已构建出 `dist`，在同级目录下执行以下脚本实现一键启动服务

```
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-dist.sh | sh 
```

#### 一键启动 `-standalone.jar`

> 脚本 [run-jar.sh](./script/run-jar.sh)

已构建出 `.jar`，在同级目录下执行以下脚本实现一键启动服务

如果 `.jar`在 `target`目录，编辑 `docker-compose.yml`中的 `volumes`为

```
volumes: 
   - ./target:/webapps
```

同时编辑 `./config/application-dev.yml`中的数据库连接配置 再重新执行 `docker-compose up`

第一次执行, 将自动下载部署文件

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh | sh
```

编辑后再次执行 直接运行以下命令

```shell
docker-compose up
```

#### 一键启动 `[src, package.json]`

> 脚本 [web-run.sh](./script/web-run.sh)

`web`源代码同级目录下执行以下脚本实现一键启动服务

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-web.sh | sh 
```

## 一键构建镜像

#### 一键构建 `api` 镜像

- 基于`-standalone.jar`构建

> 脚本 [build-jar-image.sh](./script/build-jar-image.sh)

```
target/api-1.0.0-standalone.jar
```

在 `standalone.jar`同级目录下执行以下脚本，即可构建Docker Image

> 如果 `standalone.jar`在 `target`目录下，先cd进行target目录

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar-image.sh | sh -s <image>
```

- 基于源代码`[src, pom.xml]`构建

> 脚本 [build-pom-image.sh](./script/build-pom-image.sh)

```
src/
pom.xml
```

在 `pom.xml`同级目录下执行以下脚本

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-pom-image.sh | sh -s <image>
```

右编译不通过，可进入 `mvn`容器进行调试

```shell
sh mvn.sh
```

#### 一键构建 `web` 镜像

- 基于`dist`构建

> 脚本 [build-dist-image.sh](./script/build-dist-image.sh)

在 `dist`同级目录下执行以下脚本

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist-image.sh | sh -s <image>
```

- 基于源代码`[src, package.json]`构建

> 脚本 [build-web-image.sh](./script/build-web-image.sh)

```
public/
src/
package.json
```

在 `package.json`同级目录下执行以下脚本

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-image.sh | sh -s <image>
```

## 一键部署

#### 一键部署 `dist gateway` 镜像

基于 `dist` 部署 gateway 应用

在 `dist` 同级目录下执行以下脚本

```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-gateway.sh | sh
```

进一步修改配置

- 修改`docker-compose.yml` 配置中的 network, 使之与 api 使用的`network` 一致
- 修改`conf.d/80.conf` 配置中的 api 路由

修改过 `docker-compose.yml`，重新执行启动

```shell
docker-compose up -d 
```

修改过除 `docker-compose.yml` 之外的配置文件 (e.g. `conf.d/80.conf`)，重新 docker restart

```shell
docker-compose restart
```
