#
# BUILD STAGE
#
FROM arm64v8/maven:3.9.9-eclipse-temurin-21 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -DskipTests=true clean package

#
# PACKAGE STAGE
#
FROM arm64v8/eclipse-temurin:21
COPY --from=build /usr/src/app/target/cicd-demo-0.0.1-SNAPSHOT.jar /usr/app/app.jar
EXPOSE 8080
CMD ["java","-jar","/usr/app/app.jar"]
