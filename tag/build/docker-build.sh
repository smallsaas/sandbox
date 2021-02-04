#!/bin/sh

root=${PWD}
echo root=$root

# docker-compose.yml
echo "curl -sL https://../Dockerfile -o $root/Dockerfile"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/build/Dockerfile -o $root/Dockerfile
if [ ! -f $root/Dockerfile ];then
  echo download Dockerfile fails !
  exit
fi


## run
#cd $root
docker build . -f $root/Dockerfile -t $@ 
