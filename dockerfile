# Java 8
FROM eclipse-temurin:8-jre-alpine

# Refer to Maven build -> finalName
ARG JAR_FILE=target/amsDataMI.jar

# cd /app
WORKDIR /app

# cp target/amsDataMI.jar /app/app.jar
COPY ${JAR_FILE} app.jar

# java -jar /app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
