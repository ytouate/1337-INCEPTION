FROM alpine:3.17

RUN mkdir -p /my_site && apk update && apk add nginx

COPY ./tools/nginx.conf /etc/nginx/http.d/default.conf
COPY ./tools/index.html /my_site

CMD [  "nginx", "-g", "daemon off;" ]
