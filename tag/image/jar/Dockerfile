FROM adoptopenjdk:11-jre-hotspot
WORKDIR /webapps
COPY *-standalone.jar /webapps/app.jar

# COPY ./config/application-dev.yml /webapps/config/application-dev.yml
CMD ["java", "-jar", "/webapps/app.jar", "--spring.profiles.active=dev", "--server.port=8080"]
