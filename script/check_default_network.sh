#!/bin/sh
# docker network create sandbox_network

DEFAULT_NETWORK='sandbox_network'

network=$(docker network inspect $DEFAULT_NETWORK --format {{.Name}})

if [ ! $network ];then
   docker network create $DEFAULT_NETWORK
fi
