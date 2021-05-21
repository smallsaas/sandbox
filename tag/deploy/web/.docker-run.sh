  
#!/bin/sh

root=${PWD}
echo root=$root

# docker-compose.yml
echo "curl -sL https://../docker-compose.yml -o $root/docker-compose.yml"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/api/docker-compose.yml -o $root/docker-compose.yml

## application.yml
if [ ! -d $root/config ];then
   mkdir $root/config
fi
echo "curl -sL https://../config/application.yml -o $root/config/application.yml"
curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/tag/api/config/application.yml -o $root/config/application.yml 


if [ -f docker-compose.yml ];then
   echo '# first config ..'
   echo docker-compose up -d
   #docker-compose up -d
else
   echo docker-compose.yml download fails!
fi