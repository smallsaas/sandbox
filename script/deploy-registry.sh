  
#!/bin/sh

root=${PWD}
echo root=$root

echo "curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/registry/docker-compose.yml"
curl -sOL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/registry/docker-compose.yml

if [ ! -d /var/lib/registry ];then
   mkdir /var/lib/registry
fi

if [ -f docker-compose.yml ];then
   echo docker-compose up -d
   docker-compose up -d
else
   echo download docker-compose.yml fails!
fi
