FROM jetty:9.4.49-jdk8

# 制作者信息
LABEL auther_template="Randark_JMT"

# 拷贝源码源码
COPY ./src/ROOT.war /var/lib/jetty/webapps/root.war

# 拷贝容器启动脚本
COPY ./service/docker-entrypoint.sh /
COPY ./service/flag /

EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["java","-jar","/usr/local/jetty/start.jar"]