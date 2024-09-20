FROM openjdk:8-slim-bullseye

# 制作者信息
LABEL auther_template="CTF-Archives"

# 拷贝程序和启动脚本至根目录
COPY ./src /app
COPY ./service/docker-entrypoint.sh /docker-entrypoint.sh

开放的端口取决于服务，一般为8080
# EXPOSE 8080

# 指定容器入口点
ENTRYPOINT [ "/bin/bash","/docker-entrypoint.sh" ]