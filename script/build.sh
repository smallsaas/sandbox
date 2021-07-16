#!/bin/sh
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f build.yml build $@  ## --no-cache
docker-compose -f build.yml up --remove-orphans
