FROM alpine:3.24.1
MAINTAINER simon@simonweald.com

ENV TAILCAT_VER="0.4.0"
ENV PACKAGES="\
  sudo busybox-extras bash bash-completion ncurses vim jq ca-certificates openssl screen openssh-client \
  bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep tcptraceroute \
  htop atop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

ARG TARGETARCH
RUN apk add --no-cache $PACKAGES && \
    mkdir /tmp/tailcat && \
    wget https://github.com/tailscale/tailcat/releases/download/v${TAILCAT_VER}/tailcat_${TAILCAT_VER}_linux_${TARGETARCH}.tar.gz -O /tmp/tailcat/tailcat.tar.gz && \
    tar x -f /tmp/tailcat/tailcat.tar.gz -C /tmp/tailcat/ && \
    mv /tmp/tailcat/tailcat /usr/local/bin/ && \
    rm -rf /tmp/tailcat

RUN adduser -h "/home/notroot" -g "unprivileged user" -s /bin/bash -u 1000 -D notroot notroot

COPY bashrc-cluster-id /bashrc-cluster-id

RUN echo "export CONTAINER=alpine" > /etc/container && \
    echo -e "source /etc/container\nsource /bashrc-cluster-id" >> /root/.bashrc && \
    echo -e "source /etc/container\nsource /bashrc-cluster-id" >> /home/notroot/.bashrc

ENTRYPOINT ["/bin/sleep"]
CMD ["24h"]
