  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/node/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/node/docker-compose.yml

echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/node/config.js'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/node/config.js

## start
echo "docker-compose up"
docker-compose up
