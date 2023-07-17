FROM tomcat:9.0.78-jdk8-corretto

# 制作者信息
LABEL auther_template="CTF-Archives"

# 拷贝源码源码
COPY ./src/* /usr/local/tomcat/webapps/

# 拷贝容器启动脚本
COPY ./service/docker-entrypoint.sh /

# 在根目录创建flag文件
RUN touch /flag && \
    chmod 777 /flag

# 设置服务
CMD ["/docker-entrypoint.sh"]
