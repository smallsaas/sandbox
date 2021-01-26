  
#!/bin/sh

git clone https://github.com/smallsaas/sandbox-web Docker

if [ ! -d ./Docker ];then
  echo clone sandbox-web fail !
  exit
fi

## check network
# curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/script/check_default_network.sh | bash -

## up
cd Docker
docker-compose up
