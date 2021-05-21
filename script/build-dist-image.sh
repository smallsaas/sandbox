#!/bin/sh
image=$1
if [ ! $image ];then 
  echo 'no image arg !'
  exit
fi

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/dist/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/dist/Dockerfile

if [ ! -f ./docker-build.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/docker-build.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/script/docker-build.sh
fi


echo "docker build . -t $@"
docker build . -t $@
echo ''
docker images --format "table {{.Repository}}\t{{.Tag}}" $@