#!/bin/sh
image=$1
if [ ! $image ];then
  echo 'no image arg !'
  exit
fi

docker build . -t $@ 
docker images --format "table {{.Repository}}\t{{.Tag}}" $@
