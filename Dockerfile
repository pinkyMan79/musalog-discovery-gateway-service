FROM gradle:7.6-jdk17-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

FROM openjdk:17
RUN mkdir /app

COPY build/libs/mus-disovery-gw-service-0.0.1-SNAPSHOT.jar /app/disovery-gateway-service.jar
ENTRYPOINT ["java", "-jar", "/app/disovery-gateway-service.jar"]

