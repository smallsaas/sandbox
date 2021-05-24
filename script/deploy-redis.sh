#!/bin/sh
# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/redis/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/redis/docker-compose.yml
if [ ! -d conf ];then
   mkdir conf
fi
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/redis/conf/redis.conf'
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/redis/conf/redis.conf -o conf/redis.conf

echo "docker-compose up -d"
docker-compose up -d 
