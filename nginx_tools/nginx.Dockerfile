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

ENTRYPOINT ["sh", "/script/start_nginx.sh"]

cmd ["sh"]