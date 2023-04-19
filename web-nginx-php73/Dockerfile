FROM ctftraining/base_image_nginx_php_73
# FROM tutum/lamp

RUN rm -r /var/www/html/index.php

COPY ./src/ /var/www/html

RUN chown -R www-data:www-data /var/www/html

COPY ./service/flag.sh /flag.sh

RUN chmod +x /flag.sh

CMD /flag.sh