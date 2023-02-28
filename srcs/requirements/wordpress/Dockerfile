FROM alpine:3.17

RUN apk update && apk add openrc && openrc 2> /dev/null && touch /run/openrc/softlevel &&           \
    mkdir -p /home/ytouate/data/wordpress && apk add php php-mysqli php-fpm                         \
    php-mbstring php-json php-phar php-openssl curl   &&                                            \                                           
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&            \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar.sha256  &&    \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp &&                                     \
    cd /home/ytouate/data/wordpress && wp core download                          

# RUN apk add nginx openssl && mkdir /etc/nginx/ssl

# COPY ./tools/cert.crt /etc/nginx/ssl/
# COPY ./tools/cert.key /etc/nginx/ssl/
# COPY ./tools/nginx.conf /etc/nginx/http.d/default.conf

COPY ./tools/setup.sh setup.sh
COPY ./tools/wp-config.php /

ENTRYPOINT [ "sh", "setup.sh" ]

CMD [ "php-fpm81", "-F" ]