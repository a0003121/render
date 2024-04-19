FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean install


FROM openjdk:21-jdk-slim
EXPOSE 8080
COPY --from=build /libs/demo-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
