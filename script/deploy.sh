  
#!/bin/sh

# pull first
docker-compose -f pull.yml up

# build jar
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f build.yml build --no-cache --force-rm
docker-compose -f build.yml up --remove-orphans --force-recreate --scale web=0

#final deploy 
docker-compose -f build.yml up -d --remove-orphans --scale build=0
