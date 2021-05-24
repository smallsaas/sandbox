#!/bin/sh
# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/mysql/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/mysql/docker-compose.yml

if [ ! -d mysql.conf.d ];then
   mkdir mysql.conf.d
fi
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/mysql/mysql.conf.d/sql_mode.cnf'
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/mysql/mysql.conf.d/sql_mode.cnf -o mysql.conf.d/sql_mode.cnf

docker-compose up -d 
