# --- Build Stage ---
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src
# Build the application, skipping tests to speed up deployment
RUN mvn clean package -DskipTests

# --- Run Stage ---
FROM eclipse-temurin:17-jre
WORKDIR /app
# Copy the built .jar file from the build stage
COPY --from=build /app/target/*.jar app.jar
# Expose the default Spring Boot port
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]