  
#!/bin/sh

root=${PWD}
echo root=$root

echo "curl -sL https://../docker-compose.yml -o $root/docker-compose.yml"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/registry/docker-compose.yml -o $root/docker-compose.yml

if [ ! -d /var/lib/registry ];then
   mkdir /var/lib/registry
fi

if [ -f docker-compose.yml ];then
   echo docker-compose up -d
   docker-compose up -d
else
   echo docker-compose.yml download fails!
fi