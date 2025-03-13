#
# BUILD STAGE
#
FROM maven:3.9.9-eclipse-temurin-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests=true

#
# PACKAGE STAGE
#
FROM eclipse-temurin:21
COPY --from=build /usr/src/app/target/cicd-demo-0.0.1-SNAPSHOT.jar /usr/app/app.jar
EXPOSE 8080
CMD ["java","-jar","/usr/app/app.jar"]
