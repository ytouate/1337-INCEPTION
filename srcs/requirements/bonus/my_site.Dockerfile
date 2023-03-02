FROM alpine:3.17

RUN mkdir -p /my_site

COPY ./tools/index.html /my_site

CMD [ "tail", "-f" ]
