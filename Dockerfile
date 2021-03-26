FROM alpine

LABEL com.pi2k Poliza Informatica 2000 MDS SL
LABEL maintainer Ruben Castro <rcastro@polizainformatica.com>
LABEL version v1.0.0
LABEL description Docker git

COPY  [ ".", "/rancheros-git/" ]

RUN apk add --no-cache git less openssh sudo ca-certificates && \
    chmod +x /rancheros-git/entrypoint.sh && \
    addgroup -g 1100 rancher && \
    adduser -h /home/rancher -s /bin/sh -G rancher -u 1100 -D rancher && \
    echo "rancher ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rancheros-git

VOLUME [ "/git", "/usr/local/share/ca-certificates" ]
WORKDIR /git

USER rancher

ENTRYPOINT [ "/rancheros-git/entrypoint.sh" ]
CMD [ "--help" ]
