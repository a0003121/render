FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests


FROM openjdk:21-jdk-slim
EXPOSE 8080
COPY --from=build /libs/demo-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
