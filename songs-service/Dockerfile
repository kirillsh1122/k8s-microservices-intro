# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copy wrapper & build configurations
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY song-service/build.gradle song-service/

# Download dependencies
RUN chmod +x gradlew
RUN ./gradlew :song-service:dependencies --no-daemon

# Build the application
COPY song-service/src song-service/src
RUN ./gradlew :song-service:clean :song-service:build \
    --no-daemon \
    -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/song-service/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
