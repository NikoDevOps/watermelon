FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -B -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -B -DskipTests package

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

ARG APP_VERSION=v1
ENV APP_VERSION=$APP_VERSION

COPY --from=build /app/target/watermelon.jar /app/watermelon.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/watermelon.jar"]