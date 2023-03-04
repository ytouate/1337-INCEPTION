FROM alpine:3.17

RUN apk update && mkdir /var/run/redis && \
    apk add redis && mkdir -p /home/ytouate/data/wordpress && \
    cd /home/ytouate/data/wordpress && cd /etc/ && \
    sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0/g' redis.conf

CMD [ "redis-server" ]