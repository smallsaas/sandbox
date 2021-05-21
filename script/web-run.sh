  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/web/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/web/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/web/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/web/docker-compose.yml

echo "docker-compose up --build $@"
docker-compose up --build $@ # --detach
