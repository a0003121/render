FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean install


FROM openjdk:21-jdk-slim
EXPOSE 8080
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java","-jar","demo.jar"]
