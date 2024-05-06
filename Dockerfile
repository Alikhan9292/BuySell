FROM eclipse-temurin:17.0.11_9-jre-jammy
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]


#docker build -t buysell .
#docker images
#docker run -e spring.datasource.url='jdbc:mysql://host.docker.internal:3306/buysell' -p 8081:8080 e0703be851d2