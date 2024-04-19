FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install eclipse-temurin:21-jdk-alpine -y
COPY . .
RUN ./gradlew build --no-daemon


FROM eclipse-temurin:21-jdk-alpine
EXPOSE 8080
COPY --from=build /libs/demo-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
