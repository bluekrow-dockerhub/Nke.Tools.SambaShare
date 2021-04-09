FROM alpine:3.13
LABEL Name="nke-tools-sambashare"
LABEL Mantainer="BlueKrow"
LABEL Version="1.0"

RUN apk --no-cache upgrade && apk --no-cache add samba
COPY Configs/smb.conf /etc/samba/smb.conf
COPY Scripts/* /
RUN ./setup.sh 
    
EXPOSE 445/tcp

ENTRYPOINT ["/bin/sh", "-c", "smbd && /bin/sh"]
