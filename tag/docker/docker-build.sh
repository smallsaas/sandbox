#!/bin/sh

root=${PWD}
root=$root/Docker
echo root=$root

mkdir -p $root

# docker-compose.yml
echo "curl -sL https://../docker-compose.yml -o $root/docker-compose.yml"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/docker/docker-compose.yml -o $root/docker-compose.yml
if [ ! -f $root/docker-compose.yml ];then
  echo download docker-compose.yml fails !
  exit
fi

# docker-compose.yml
echo "curl -sL https://../Dockerfile -o $root/Dockerfile"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/docker/Dockerfile -o $root/Dockerfile
if [ ! -f $root/Dockerfile ];then
  echo download Dockerfile fails !
  exit
fi


## run
cd $root
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose build
docker-compose run --rm api
cd ..
ls target