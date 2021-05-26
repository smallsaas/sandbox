  
#!/bin/sh

# pull first
docker-compose up pull 

# build jar
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose up --build --remove-orphans build

#final deploy 
docker-compose up --scale pull=0 --scale build=0 --detach  