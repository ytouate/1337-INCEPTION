FROM alpine:3.17

RUN apk update && apk add php php-mysqli php-pdo_mysql php-json php-session wget nginx php-fpm

RUN wget https://github.com/vrana/adminer/releases/latest/download/adminer-4.8.1.php

RUN apk add vim openrc && openrc && touch /run/openrc/softlevel

RUN  mv adminer-4.8.1.php /var/www/localhost/htdocs/
COPY ./tools/nginx.conf /etc/nginx/http.d/default.conf

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh


ENTRYPOINT [ "sh", "setup.sh" ]

CMD [ "php-fpm81", "-F" ]