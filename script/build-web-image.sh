  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/docker-compose.yml

if [ ! -f ./build.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/docker-build.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/docker-build.sh
fi

echo "COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build $@"
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build $@ # --detach
