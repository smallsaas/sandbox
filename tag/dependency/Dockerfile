FROM zelejs/allin-web:m2 AS m2

#builk-stage
FROM maven:3.6.0-jdk-11-slim AS build

# init .m2 from alpine-m2 image first
WORKDIR /root/.m2
COPY --from=M2 /root/.m2/settings.xml /root/.m2


WORKDIR /usr/src
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw cp -r /root/m2/* /root/.m2


RUN echo '#!/bin/sh' > dependency-copy
RUN echo 'mvn org.apache.maven.plugins:maven-dependency-plugin:3.2.0:copy -Dartifact=$1 -DoutputDirectory=./' >> dependency-copy
RUN chmod +x /usr/src/dependency-copy


ENTRYPOINT ["/usr/src/dependency-copy"]
