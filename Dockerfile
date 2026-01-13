# 第一阶段：构建 jar
FROM gradle:8.5.0-jdk21 as builder
WORKDIR /app
COPY . .
RUN gradle build -x test --no-daemon

# 第二阶段：运行 jar
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]