FROM alpine:3.17

RUN apk update && apk add openrc && apk add nginx && openrc && touch /run/openrc/softlevel &&   \
    apk add vim && apk add openssl && mkdir /etc/nginx/ssl

COPY ./tools/cert.crt /etc/nginx/ssl/
COPY ./tools/cert.key /etc/nginx/ssl/
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY ./tools/setup.sh /script/setup.sh

RUN apk add mariadb mariadb-client php-mysqli php-fpm && /etc/init.d/mariadb setup &&           \
    cd /etc/my.cnf.d  && apk add php-mbstring      &&                                           \
    sed 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' > mariadb-server.cnf &&                \
    apk add php php-json php-phar php-openssl curl &&                                           \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&        \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar.sha256 && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp &&                                 \
    cd /var/www/localhost/htdocs/ && mkdir wordpress && cd wordpress  && wp core download

ENTRYPOINT ["sh", "/script/setup.sh"]

CMD ["sh"]