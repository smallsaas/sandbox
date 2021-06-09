  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/docker-compose.yml

if [ ! -d conf.d ];then
  mkdir conf.d
fi

if [ ! -f ./conf.d/default.conf ];then
cd conf.d
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/conf.d/default.conf'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/conf.d/default.conf
cd ..
fi

## start
echo "docker-compose up -d $@"
docker-compose up -d $@
