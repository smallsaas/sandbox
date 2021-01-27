  
#!/bin/sh

root=${PWD}
echo root=$root

# docker-compose.yml
echo "curl -sL https://../docker-compose.yml -o $root/docker-compose.yml"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/mysql/docker-compose.yml -o $root/docker-compose.yml

if [ ! -f ./docker-compose.yml ];then
  echo download docker-compose.yml fails !
  exit
fi

## run
docker-compose up -d