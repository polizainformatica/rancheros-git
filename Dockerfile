FROM alpine:3.13

LABEL com.pi2k Poliza Informatica 2000 MDS SL
LABEL maintainer Ruben Castro <rcastro@polizainformatica.com>
LABEL version v1.0.1
LABEL description git in docker

RUN apk add --no-cache git less openssh sudo ca-certificates && \
    addgroup rancher && \
    adduser -h /home/rancher -s /bin/sh -G rancher -D rancher && \
    echo "rancher ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rancheros-git

WORKDIR /app
COPY  [ "./entrypoint.sh", "./" ]

VOLUME [ "/git" ]
WORKDIR /git

USER rancher

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD [ "--help" ]
