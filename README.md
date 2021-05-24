# 用于开发环境的快速部署方案

一键安装 `docker`
```shell
curl -sSL https://get.daocloud.io/docker | sh
```
>
一键安装 `docker-comppose`
> [Github](https://github.com/docker/compose)
```shell
curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

### 一键构建安装包
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| build jar| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar.sh \| sh` | 通过容器构建jar |
| build dist| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist.sh \| sh` | 通过容器构建dist |
||||
>
### 一键构建镜像
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| jar image| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar-image.sh \| sh -s <image>` | 通过`jar`构建`api`镜像 |
| dist image| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist-image.sh \| sh -s <image>` | 通过`dist`构建`web`镜像 |
| pom.xml image| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-pom-image.sh \| sh -s <image>` | 通过`pom.xml`构建`api`镜像 |
| web image| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-image.sh \| sh -s <image>` | 通过`package.json`构建`web`镜像 |
| web dev image| `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-dev-image.sh \| sh -s <image>` | 通过`package.json`构建`web dev`镜像 |
||||

#### 一键启动
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| dist | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-dist.sh \| sh` | 直接启动`dist` |
| web | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-web.sh \| sh ` | 直接启动`web[src, package.json]`  |
| jar | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh \| sh ` | 直接启动`jar`,需配置数据库连接 |
| api | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-api.sh \| sh ` | 启动`api` image,需配置数据库连接 |
||||


#### 一键部署
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| registry | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh` | 部署`registry` |
| mysql    | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh` | 部署`mysql`  |
| frps | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frps.sh \| sh` | 部署`frps` |
| frpc | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frpc.sh \| sh` | 部署`frpc` |
||||

#### 一键启动
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| dist | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-dist.sh \| sh` | 启动`dist` |
| web | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-web.sh \| sh ` | 启动`web`  |
| jar | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh \| sh ` | 启动`jar`  |
||||


#### 一键部署
| Type     | Script                                                                                 | Link                          |
| :------- | :------------------------------------------------------------------------------------- | ----------------------------- |
| registry | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh` | 部署`registry` |
| mysql    | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy-mysql.sh \| sh` | 部署`mysql`  |
| frps | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frps.sh \| sh` | 部署`frps` |
| frpc | `curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/frpc.sh \| sh` | 部署`frpc` |
||||


## 构建安装包

#### 一键构建`.jar`
> 脚本 [build-jar.sh](./script/build-jar.sh)
>
源代码目录如下
```
src/
pom.xml
```
在`pom.xml`同级目录下执行以下脚本，即可构建出`-standalone.jar`执行包
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar.sh | sh 
```

#### 一键构建`dist`
> 脚本 [build-dist.sh](./script/build-dist.sh)
>
源代码目录如下
```
public/
src/
package.json
```
在`package.json`同级目录下执行以下脚本，即可构建出`dist`
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-dist.sh | sh 
```

## 构建镜像

#### 一键构建`api`镜像
- 基于`-standalone.jar`构建
> 脚本 [build-jar-image.sh](./script/build-jar-image.sh)
```
target/api-1.0.0-standalone.jar
```
>
在`standalone.jar`同级目录下执行以下脚本，即可构建Docker Image
> 如果`standalone.jar`在`target`目录下，先cd进行target目录
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-jar-image.sh | sh -s <image>
```
>
>
- 基于源代码`[src, pom.xml]`构建
> 脚本 [build-pom-image.sh](./script/build-pom-image.sh)
```
src/
pom.xml
```
>
在`pom.xml`同级目录下执行以下脚本
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-pom-image.sh | sh -s <image>
```
>
右编译不通过，可进入`mvn`容器进行调试
```shell
sh mvn.sh
```

#### 一键构建`web`镜像
- 基于`dist`构建
> 脚本 [build-dist-image.sh](./script/build-dist-image.sh)
>
在`dist`同级目录下执行以下脚本
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
>
在`package.json`同级目录下执行以下脚本
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/build-web-image.sh | sh -s <image>
```


## 启动

#### 一键启动`dist`
> 脚本 [run-dist.sh](./script/run-dist.sh)
>
已构建出`dist`，在同级目录下执行以下脚本实现一键启动服务
```
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-dist.sh | sh 
```


#### 一键启动`[src, package.json]` 
> 脚本 [web-run.sh](./script/web-run.sh)
>
`web`源代码同级目录下执行以下脚本实现一键启动服务
>
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-web.sh | sh 
```


#### 一键启动`api` image
基于已构构建的`api`image, 实现一键启动`api`服务
>需要配置`docker-compose.yml`变更镜像(image)名称, 从及配置`config/application-dev.yml`连接数据库
>
```shell
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/script/run-api.sh | sh
```
