  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/docker-compose.yml
if [ ! -d config ];then
  mkdir config
fi

cd config
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/config/application-dev.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/api/config/application-dev.yml
cd ..


if [ ! -f deploy.sh ];then
  echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/scripot/deploy.sh'
  curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy.sh
fi


## start
echo 'change the image name in docker-compose.yml, and run below command'
echo "docker-compose up $@"
# docker-compose up $@
