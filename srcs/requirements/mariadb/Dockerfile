FROM alpine:3.17

RUN apk update && apk add openrc && openrc && touch /run/openrc/softlevel && \
    apk add mariadb mariadb-client && /etc/init.d/mariadb setup 

COPY setup.sh setup.sh

RUN chmod +x setup.sh

ENTRYPOINT [ "sh", "setup.sh" ]

CMD ["mysqld", "--user=mysql"]

