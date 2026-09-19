# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copy wrapper & build configurations
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY songs-service/build.gradle songs-service/

# Download dependencies
RUN chmod +x gradlew
RUN ./gradlew :songs-service:dependencies --no-daemon

# Build the application
COPY songs-service/src songs-service/src
RUN ./gradlew :songs-service:clean :songs-service:build \
    --no-daemon \
    -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/songs-service/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
