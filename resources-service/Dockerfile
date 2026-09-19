# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copy wrapper & build configurations
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY resources-service/build.gradle resources-service/

# Download dependencies
RUN chmod +x gradlew
RUN ./gradlew :resources-service:dependencies --no-daemon

# Build the application
COPY resources-service/src resources-service/src
RUN ./gradlew :resources-service:clean :resources-service:build \
    --no-daemon \
    -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/resources-service/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
