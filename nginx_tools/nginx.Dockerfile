FROM alpine:3.17

# SET UP BASIC REQUIREMENTS
RUN apk update && \
    apk add openrc && \
    apk add nginx && \
    rc-status 2> /dev/null && \
    touch /run/openrc/softlevel && \
    apk add vim

RUN apk add openssl && \
    mkdir /etc/nginx/ssl

COPY cert.crt /etc/nginx/ssl/
COPY cert.key /etc/nginx/ssl/
COPY nginx.conf /etc/nginx/http.d/default.conf

COPY start_nginx.sh /script/start_nginx.sh

# WORDPRESS SET UP

# install dependencies
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk update && apk add  php7 \
    php7-common php7-session \
    php7-iconv php7-json php7-gd \
    php7-curl php7-xml php7-mysqli \
    php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt \
    php7-gettext php7-ldap \
    php7-ctype php7-dom \
    php7-simplexml wget && \
    mkdir -p /usr/share/webapps/ && \
    cd /usr/share/webapps/ && \
    wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz


ENTRYPOINT ["sh", "/script/start_nginx.sh"]

cmd ["sh"]