  
#!/bin/sh

echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frpc/docker-compose.yaml'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frpc/docker-compose.yaml
echo 'curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frpc/frpc.ini'
curl -sOL https://gitee.com/smallsaas/sandbox/raw/master/tag/frp/frpc/frpc.ini

echo "docker-compose up $@"
docker-compose up $@ # --detach

