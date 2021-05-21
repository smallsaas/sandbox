#!/bin/sh
image=$1
if [ ! $image ];then
  echo 'no image arg !'
  exit
fi

DOCKER_BUILDKIT=1 docker build . -t $@ 
docker images --format "table {{.Repository}}\t{{.Tag}}" $@
