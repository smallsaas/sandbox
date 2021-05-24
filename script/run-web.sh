  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/docker-compose.yml

## optional for debug
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/install.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/install.sh
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/start.sh'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/web/start.sh

## start
echo "docker-compose run --rm web npm install"
docker-compose run --rm web npm install 
echo "docker-compose run --rm --service-ports web npm start"
docker-compose run --rm --service-ports web npm start 
