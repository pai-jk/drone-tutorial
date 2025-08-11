# 테스트 빌드를 위한 초간단 서버(Alpine + Busybox HTTPD)
FROM alpine:3.20
RUN adduser -D -u 10001 app && \
    mkdir -p /app && \
    echo "hello from $(cat /etc/alpine-release)" > /app/index.html
USER 10001
WORKDIR /app
EXPOSE 8080
# health-like check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://127.0.0.1:8080/ || exit 1
  
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/app"]