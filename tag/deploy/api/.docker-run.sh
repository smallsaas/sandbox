  
#!/bin/sh

#clone
git clone https://github.com/smallsaas/sandbox-api .

if [ ! -f ./docker-compose.yml ];then
  echo download docker-compose.yml fails !
  exit
fi

## up
docker-compose up
