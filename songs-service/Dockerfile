# Smaller OS footprint using JRE
FROM gradle:jdk21
WORKDIR /app

ADD build/libs/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]