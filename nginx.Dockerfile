FROM alpine:3.17

RUN apk update && \
    apk add openrc && \
    apk add nginx && \
    rc-status 2> /dev/null && \
    touch /run/openrc/softlevel && \
    apk add vim && \
    apk add openssl

COPY start_nginx.sh /script/start_nginx.sh

ENTRYPOINT ["sh", "/script/start_nginx.sh"]

cmd ["sh"]