  
#!/bin/sh

git clone https://github.com/smallsaas/sandbox-web .

if [ ! -f ./docker-compose.yml ];then
  echo download docker-compose.yml fails !
  exit
fi

## check network
# curl -sL https://raw.githubusercontent.com/smallsaas/sandbox/master/script/check_default_network.sh | bash -

## up
docker-compose up
