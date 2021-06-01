  
#!/bin/sh

# docker-compose.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/web/docker-compose.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/web/docker-compose.yml

## download Dockerfile
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/Dockerfile'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/build/dist/Dockerfile

## pull.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/pull.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/pull.yml
## build.yml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/web/build.yml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/deploy/web/build.yml

if [ ! -f deploy.sh ];then
  echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/scripot/deploy.sh'
  curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/script/deploy.sh
fi

## start
echo "sh ./deploy.sh"
sh ./deploy.sh
