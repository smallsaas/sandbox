  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/docker-compose.yml

echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/build.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/build.sh


echo "docker-compose up --build $@"
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose up --build $@ # --detach
