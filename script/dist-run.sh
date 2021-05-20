  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/docker-compose.yml

echo "docker-compose up --build $@"
docker-compose up --build $@ # --detach
