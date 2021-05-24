  
#!/bin/sh

echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frps/docker-compose.yaml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frps/docker-compose.yaml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frps/frps.ini'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frps/frps.ini

echo "docker-compose up $@"
docker-compose up $@ # --detach
