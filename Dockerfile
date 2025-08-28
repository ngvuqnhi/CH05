# ---------- Stage 1: Build WAR từ pom.xml ----------
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Tải deps để cache
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

# Copy source và build WAR
COPY . .
RUN mvn -q -DskipTests package

# ---------- Stage 2: Tomcat 11 chạy WAR ----------
FROM tomcat:11.0-jdk17-temurin

# Optional: xoá webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR vừa build vào ROOT.war để chạy ở "/"
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
