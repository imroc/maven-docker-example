FROM docker.io/library/maven:3.8-jdk-11 AS build

COPY src /app/src
COPY pom.xml /app

RUN mvn -f /app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /app/target/app.jar /app/app.jar
COPY --from=build /app/target/lib /app/lib
ENTRYPOINT ["java","-jar","/app/app.jar"]
