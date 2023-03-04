FROM alpine:3.17


RUN apk update && apk add vsftpd openrc && openrc && \
    touch /run/openrc/softlevel

COPY  ./tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY  ./tools/setup.sh / 

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]

ENTRYPOINT [ "sh", "setup.sh" ]

