# DOCKER_BUILDKIT=1 docker build . -t allin-web:cache-package-m2 --no-cache
## src stage
FROM zelejs/allin-web:git AS git
# RUN echo 'github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl' > /root/.ssh/known_hosts
# RUN echo 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> /root/.ssh/known_hosts
# RUN echo 'github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=' >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
####################################
WORKDIR /usr
RUN git clone --depth=1 git@github.com:smallsaas/nft.git --single-branch -b nft-artifact-auth src
######################################

## m2 stage
FROM zelejs/allin-web:alpine-m2 AS m2

#builk-stage
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /root/m2
COPY --from=m2 /root/.m2 /root/.m2

## mvn package
WORKDIR /usr/src

COPY --from=git /usr/src/pom.xml  ./pom.xml
COPY --from=git /usr/src/src ./src
RUN rm -rf /root/.m2/repository/com/jfeat/
RUN mvn -DskipStandalone=true package -Dmaven.test.skip=true


## final-cache
FROM alpine:3.12
WORKDIR /root/.m2
COPY --from=build /root/.m2 /root/.m2

