FROM php:8.0-apache

# 制作者信息
LABEL auther_template="CTF-Archives"

# Apache 初始化
RUN a2enmod rewrite

# 安装必要的软件包
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    # apk add --update --no-cache tar apache mysql mysql-client bash
    apt update && \
    apt install -y default-mysql-client default-mysql-server

# 配置mysql
RUN docker-php-source extract && \
    docker-php-ext-install pdo_mysql mysqli && \
    docker-php-source delete && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    sh -c 'mysqld_safe &' && \
    sleep 5s && \
    mysqladmin -uroot password 'root'

# 复制mysql配置文件
COPY ./config/docker-php-ext-mysqli.ini /usr/local/etc/php/conf.d
COPY ./config/docker-php-ext-pdo_mysql.ini /usr/local/etc/php/conf.d

# 复制web项目源码
COPY src /var/www/html

# 重新设置源码路径的用户所有权
RUN chown -R www-data:www-data /var/www/html

# 复制数据库配置文件
COPY ./data/db.sql /var/db.sql

# 拷贝容器入口点脚本
COPY ./service/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# 配置数据库数据
RUN sh -c 'mysqld_safe &' \
    && sleep 5s \
    && mysqladmin -uroot password '123456' \ 
    && mysql -e "source /var/db.sql;" -uroot -p123456

# 设置shell的工作目录
WORKDIR /var/www/html

EXPOSE 80

# 设置nginx日志保存目录
VOLUME ["/var/log/nginx"]

# 设置容器入口点
ENTRYPOINT [ "/docker-entrypoint.sh" ]
