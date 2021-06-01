  
#!/bin/sh

# pull first
docker-compose -f pull.yml up

# build jar
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f build.yml up --build --remove-orphans

#final deploy 
docker-compose up --scale pull=0 --scale build=0 --detach --remove-orphans
