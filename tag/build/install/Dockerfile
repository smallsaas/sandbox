# DOCKER_BUILDKIT=1 docker build . -t allin-web-install-jar-1 --no-cache
# docker build . -t allin-web-install-jar-1 --no-cache
## src stage
FROM zelejs/allin-web:git AS git
# RUN echo 'github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl' > /root/.ssh/known_hosts
# RUN echo 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> /root/.ssh/known_hosts
# RUN echo 'github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=' >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
####################################
WORKDIR /usr
RUN git clone --depth=1 git@github.com:smallsaas/nft.git --single-branch -b nft-oms src
######################################

#cache-stage
FROM allin-web:cache-install-m2 as cache

#builk-stage
FROM maven:3.6.0-jdk-11-slim AS build

# init .m2 from alpine-m2 image first
WORKDIR /root/.m2
COPY --from=cache /root/.m2 /root/.m2


## mvn package
WORKDIR /usr/src
# RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn dependency:go-offline -Dmaven.main.skip=true -Dmaven.test.skip=true
COPY --from=git /usr/src/pom.xml  ./pom.xml
COPY --from=git /usr/src/src ./src
# RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn dependency:go-offline -Dmaven.main.skip=true -Dmaven.test.skip=true
RUN rm -rf /root/.m2/repository/com/jfeat/
RUN mvn -DskipStandalone=true install deploy -Dmaven.test.skip=true


## final
FROM alpine:3.12
WORKDIR /usr/src/target
COPY --from=build /usr/src/target/*.jar .
# WORKDIR /var/m2
# RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw cp -r /root/.m2/* /var/m2
CMD ["sh", "-c", "/bin/cp /usr/src/target/*.jar /var/webapps"]

