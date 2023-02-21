FROM alpine:3.17

RUN apk update &&                                                                                \
    apk add openrc &&                                                                            \
    apk add nginx &&                                                                             \
    rc-status 2> /dev/null &&                                                                    \
    touch /run/openrc/softlevel &&                                                               \
    apk add vim &&                                                                               \
    apk add openssl &&                                                                           \
    mkdir /etc/nginx/ssl

COPY cert.crt /etc/nginx/ssl/
COPY cert.key /etc/nginx/ssl/
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY start_nginx.sh /script/start_nginx.sh

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories &&          \
    apk update && apk add php-fpm wget  &&                                                      \
    mkdir -p /usr/share/webapps/ &&                                                             \
    cd /usr/share/webapps/ &&                                                                   \
    wget http://wordpress.org/latest.tar.gz &&                                                  \
    tar -xzvf latest.tar.gz &&                                                                  \
    rm latest.tar.gz  &&                                                                        \
    ln -s   /usr/share/webapps/wordpress/                                                       \
            /var/www/localhost/htdocs/wordpress

RUN apk add mariadb mariadb-client php-mysqli &&                                                \
    /etc/init.d/mariadb setup  &&                                                               \
    cd /var/www/localhost/htdocs/wordpress/                                                     \
    cd /etc/my.cnf.d                                                                            \
    sed 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g'                                        \
    mariadb-server.cnf         &&                                                               \
    apk add php php-json php-phar php-openssl curl   &&                                         \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&        \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar.sha256 && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp                       


COPY DB.txt .
COPY wp-config.php /var/www/localhost/htdocs/wordpress

ENTRYPOINT ["sh", "/script/start_nginx.sh"]

CMD ["sh"]