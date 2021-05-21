  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/docker-compose.yml

## optional for debug
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/run.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/run.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/run.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/run.sh


if [ ! -f ./build.sh ];then
echo 'curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/build.sh -o startup.sh'
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/build.sh -o startup.sh
fi


echo "COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose up --build $@"
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose up --build $@ # --detach
