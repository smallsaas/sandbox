  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/docker-compose.yml
if [ ! -d config ];then
  mkdir config
fi

## download Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/jar/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/api/Dockerfile

## config
cd config
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/config/application-dev.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/config/application-dev.yml
cd ..


if [ ! -f deploy.sh ];then
  echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/scripot/deploy.sh'
  curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy.sh
fi

## start
echo '=>config config/application-dev.yml for database connection'
echo ', and then run below command'
echo "sh ./deploy.sh"
sh ./deploy.sh
