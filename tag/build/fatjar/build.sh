## get Dockerfile
image='build-fatjar-1'
####

if [ ! -f Dockerfile ];then
docker run --rm -v ${PWD}:/var/build zelejs/sandbox cp /sandbox/tag/build/fatjar/Dockerfile /var/build/
fi

## build jar
DOCKER_BUILDKIT=1 docker build . -t $image
docker run --rm -v ${PWD}/target:/var/webapps $image
ls target/*.jar
docker image rm $image
# rm -f Dockerfile
