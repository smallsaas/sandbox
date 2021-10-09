  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/jar/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/jar/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/jar/build.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/jar/build.yml

if [ ! -f ./build.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build.sh
fi

echo "COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f build.yml up --build $@"
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose  -f build.yml up --build $@ # --detach
