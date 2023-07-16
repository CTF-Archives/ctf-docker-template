FROM jetty:9.4.49-jdk8

# 制作者信息
LABEL auther_template="CTF-Archives"

# 拷贝源码源码
COPY ./src/root.war /var/lib/jetty/webapps/root.war

# 拷贝容器启动脚本
COPY ./service/docker-entrypoint.sh /

# 通过root权限，在根目录创建flag文件，并转移所有权给jetty
USER root
RUN touch /flag && \
    chown -R jetty:jetty /flag && \
    chmod 777 /flag

# 处于安全考虑，将用户状态迁移回jetty
USER jetty

# 设置服务
CMD ["/docker-entrypoint.sh"]
