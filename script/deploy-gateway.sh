  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/docker-compose.yml
if [ ! -d conf.d ];then
  mkdir conf.d
fi

cd conf.d
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/conf.d/80.conf'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/gateway/conf.d/80.conf
cd ..

## start
echo "docker-compose up -d $@"
docker-compose up -d $@
