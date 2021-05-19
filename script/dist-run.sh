  
#!/bin/sh

root=${PWD}
echo root=$root

# docker-compose.yml
echo "curl -sOL https://../Dockerfile"
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/Dockerfile.sh
echo "curl -sOL https://../docker-compose.yml -o ./docker-compose.yml"
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/dist/docker-compose.yml

docker-compose up --build --detach
