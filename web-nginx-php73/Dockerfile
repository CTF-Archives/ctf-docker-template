FROM php:7.3-fpm-alpine

# 制作者信息
LABEL auther_template="CTF-Archives"

COPY src /var/www/html

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories  &&\
    apk add --update --no-cache nginx bash

COPY ./service/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

COPY ./config/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# [可选]指定对外暴露端口，对于GZCTF等平台，强制EXPOSE可能会造成非预期端口泄露，请酌情启用
# EXPOSE 80

VOLUME ["/var/log/nginx"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]