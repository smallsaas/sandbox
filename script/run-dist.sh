  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/run/docker-compose.yml

echo "docker-compose up $@"
docker-compose up $@ # --detach
