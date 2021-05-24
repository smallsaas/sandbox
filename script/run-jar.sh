  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/docker-compose.yml
if [ ! -d config ];then
  mkdir config
fi
echo 'curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/config/application-dev.yml -o ./config/application-dev.yml'
curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/config/application-dev.yml -o ./config/application-dev.yml

#script
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/run-jar.sh


## start
echo "docker-compose up"
docker-compose up
