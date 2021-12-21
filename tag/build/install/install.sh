# DOCKER_BUILDKIT=1 docker build -f Dockerfile.cache . -t nft:cache-m2
DOCKER_BUILDKIT=1 docker build . -t build-jar-1
docker run --rm -v ${PWD}/target:/var/webapps build-jar-1
ls target
docker image rm build-jar-1
