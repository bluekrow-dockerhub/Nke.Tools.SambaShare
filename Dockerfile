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
    adduser --no-create-home --disabled-password --uid 1000 --shell /bin/false --ingroup smbgroup user && \
    echo -e "pass\npass" | smbpasswd -a -s user
    
EXPOSE 445/tcp

ENTRYPOINT ["/bin/sh", "-c", "smbd && /bin/sh"]
