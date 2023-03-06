FROM alpine:3.17


RUN apk update && apk add vsftpd openrc && openrc && \
    touch /run/openrc/softlevel

COPY  ./tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY  ./tools/setup.sh / 

EXPOSE 20/tcp 21/tcp 40000-40009/tcp

ENTRYPOINT [ "sh", "setup.sh" ]

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]