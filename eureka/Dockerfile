# Smaller OS footprint using JRE
FROM gradle:jdk21
WORKDIR /app

# Copy only the Jar from the current dir
ADD build/libs/*.jar /app/app.jar

# Run the Jar = Final image only containes
CMD ["java", "-jar", "app.jar"]

