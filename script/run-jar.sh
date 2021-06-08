  
#!/bin/sh

# docker-compose.yml
if [ ! -f ./docker-compose.yml ];then
  echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/docker-compose.yml'
  curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/docker-compose.yml
fi

if [ ! -f ./config/application-dev.yml ];then
  if [ ! -d config ];then
    mkdir config
  fi
  echo 'curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/config/application-dev.yml -o ./config/application-dev.yml'
  curl -sL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/jar/config/application-dev.yml -o ./config/application-dev.yml
fi

## start
echo "docker-compose up"
echo "docker-compose up -d"
docker-compose up
