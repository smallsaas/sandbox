# 用于开发环境的快速部署方案

#### 一健部署私服 `registry`
[docker-compose.yml](./tag/registry/docker-compose.yml)

```
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/registry/docker-run.sh | bash -
```

## sandbox api

#### raw.githubusercontent.com
```
cat /etc/hosts
151.101.64.133 raw.githubusercontent.com
```
或
```
echo '151.101.64.133 raw.githubusercontent.com' >> /etc/hosts
```

#### network
> 以下服务可以独立运行，只要使用同一网络，先创建网络
```
docker network create sandbox_network
```

#### 一键部署 `mysql`
[docker-compose.yml](./tag/mysql/docker-compose.yml)

```
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/mysql/docker-run.sh | bash -
```

#### 一键部署 `web dist`
[sandbox-web](https://github.com/smallsaas/sandbox-web)

```
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/web/docker-run.sh | bash -
```

#### 一键部署 `api`
[sandbox-api](https://github.com/smallsaas/sandbox-api)

```
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/api/docker-run.sh | bash -
```
