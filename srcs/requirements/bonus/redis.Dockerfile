FROM alpine:3.17

RUN apk update &&  mkdir /var/run/redis && apk add redis && mkdir -p /home/ytouate/data/wordpress && cd /home/ytouate/data/wordpress

CMD [ "redis-server" ]