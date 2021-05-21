FROM zelejs/allin-web:alpine-m2 AS M2

#builk-stage
FROM maven:3.6.0-jdk-11-slim AS build
#init .m2 from alpine-m2 image first
WORKDIR /root/.m2
COPY --from=M2 /root/.m2 /root/m2
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw cp -r /root/m2/* /root/.m2

WORKDIR /usr/src

#build
COPY ./pom.xml  ./pom.xml
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn dependency:go-offline -Dmaven.main.skip=true -Dmaven.test.skip=true

#To package the application
COPY ./src ./src
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn -DskipStandalone=false package -Dmaven.test.skip=true

# #for from github
# RUN git clone https://github.com/cescoffier/my-vertx-first-app
# RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn -DskipStandalone=false package -Dmaven.test.skip=true

FROM adoptopenjdk:11-jre-hotspot
WORKDIR /webapps
COPY --from=build /usr/src/target/*-standalone.jar /webapps/app.jar

# COPY ./config/application-dev.yml /webapps/config/application-dev.yml
CMD ["java", "-jar", "/webapps/app.jar", "--spring.profiles.active=dev", "--server.port=8080"]
