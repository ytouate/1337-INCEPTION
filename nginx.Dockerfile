FROM alpine:3.17

RUN apk update
RUN apk add openrc
RUN apk add nginx
RUN rc-status 2> /dev/null && touch /run/openrc/softlevel
COPY start_nginx.sh /script/start_nginx.sh
ENTRYPOINT ["sh", "/script/start_nginx.sh"]
cmd ["sh"]