FROM alpine:3.13
LABEL Name="nke-tools-sambashare"
LABEL Mantainer="BlueKrow"
LABEL Version="1.0"

RUN apk --no-cache upgrade && apk --no-cache add samba
COPY Configs/smb.conf /etc/samba/smb.conf
RUN mkdir -p /media/storage && \
    echo "shared content" > /media/storage/shared-file.txt && \ 
    chmod 0777 /media/storage && \
    addgroup -g 1000 smbgroup && \
    adduser --no-create-home --disabled-password --uid 1000 --shell /bin/false --ingroup smbgroup smbuser && \
    echo -e "smbpass\nsmbpass" | smbpasswd -a -s smbuser && \
    mkdir -p /run/openrc && \
    touch /run/openrc/softlevel    

EXPOSE 139/tcp 445/tcp

ENTRYPOINT ["smbd", "-F","-i","-d=3"]    