FROM eclipse-temurin:17-jdk-jammy as base

# Set work directory
WORKDIR /app

# Copy the JAR file
COPY target/user-service-1.0.0.jar app.jar

# Expose port
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
