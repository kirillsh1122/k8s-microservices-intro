# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copy wrapper & build configurations
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY eureka/build.gradle eureka/

# Download dependencies
RUN chmod +x gradlew
RUN ./gradlew :eureka:dependencies --no-daemon

# Build the application
COPY eureka/src eureka/src
RUN ./gradlew :eureka:clean :eureka:build \
    --no-daemon \
    -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app
COPY --from=build /app/eureka/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
