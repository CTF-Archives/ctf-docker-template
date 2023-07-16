# web-tomcat-war-jetty

直接将war文件放入`./src`目录即可，文件名在`./service/docker-entrypoint.sh`内记得更改

如题目服务不在`8080`端口，则需要修改`./Dockerfile`,`./docker/docker-compose.yml`内的端口设置