#!/bin/sh
image=$1
if [ ! $image ];then 
  echo 'no image arg !'
  exit
fi

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/web/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/image/web/Dockerfile

if [ ! -f ./docker-build.sh ];then
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build-image.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/build-image.sh
fi

## update docker-compose.yml with built image name
# sed -i s/image\:[[:space:]]*[a-zA-Z]*[\:]*[a-zA-Z]*/image:\"$image\"/ ./docker-compose.yml

echo "DOCKER_BUILDKIT=1 docker build . -t $@"
DOCKER_BUILDKIT=1 docker build . -t $@
echo ''
docker images --format "table {{.Repository}}\t{{.Tag}}" $@
