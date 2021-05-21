#!/bin/sh
image=$1
if [ ! $image ];then 
  echo 'no image arg !'
  exit
fi

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/docker-compose.yml
if [ ! -f ./mvn.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/mvn.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/pom/mvn.sh
fi

if [ ! -f ./docker-build.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build-image.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build-image.sh
fi

echo "DOCKER_BUILDKIT=1 docker build . -t $@"
DOCKER_BUILDKIT=1 docker build . -t $@
echo ''
docker images --format "table {{.Repository}}\t{{.Tag}}" $@
