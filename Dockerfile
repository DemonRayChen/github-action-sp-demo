# 第一阶段：构建 jar
FROM gradle:8.5.0-jdk21 as builder
WORKDIR /app

# 先单独复制 wrapper/构建脚本和依赖配置，为前置依赖缓存加速
COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle* .
COPY settings.gradle* .
RUN chmod +x gradlew

# 再复制源码
COPY src src

# 构建 jar 包
RUN ./gradlew build -x test --no-daemon

# 第二阶段：运行 jar
FROM eclipse-temurin:21-jre
WORKDIR /app

# 复制生成的 jar 包
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]