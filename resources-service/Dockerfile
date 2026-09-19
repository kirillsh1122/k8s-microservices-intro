# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copy wrapper & build configurations
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY resource-service/build.gradle resource-service/

# Download dependencies
RUN chmod +x gradlew
RUN ./gradlew :resource-service:dependencies --no-daemon

# Build the application
COPY resource-service/src resource-service/src
RUN ./gradlew :resource-service:clean :resource-service:build \
    --no-daemon \
    -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/resource-service/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
