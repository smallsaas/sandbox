#!/usr/bin/bash

# getimage() {
   image=maven:3.6.0-jdk-11-slim
   if [ $(uname -m) = armv7l ];then 
      image=arm32v7/maven:3.6-adoptopenjdk-11

      # arm32v7/maven:3.6-openjdk-11-slim
      image2=arm32v7/maven:3.6.3-openjdk-11-slim
      if [ $(docker image ls $image2 --format='{{.ID}}' 2> /dev/null) ];then
         image=$image2
      fi
   else
      # maven:3.6-openjdk-11-slim
      image2=maven:3.6-openjdk-11-slim
      if [ $(docker image ls $image2 --format='{{.ID}}') ];then
         image=$image2
      fi
   fi
#    echo $image
# }

docker run --privileged --rm -v $HOME/.m2:/root/.m2 -v ${PWD}:/usr/src -w /usr/src $image mvn $@
