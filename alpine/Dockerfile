FROM alpine:3.10.1
MAINTAINER simon@simonweald.com

ENV CROC_VER="8.0.13"
ENV PACKAGES="\
  sudo busybox-extras bash bash-completion ncurses vim jq ca-certificates openssl screen \
  bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep tcptraceroute \
  htop atop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

RUN apk add --no-cache $PACKAGES && \
    mkdir /tmp/croc && \
    wget https://github.com/schollz/croc/releases/download/v${CROC_VER}/croc_${CROC_VER}_Linux-64bit.tar.gz -O /tmp/croc/croc.tar.gz && \
    tar x -f /tmp/croc/croc.tar.gz -C /tmp/croc/ && \
    mv /tmp/croc/croc /usr/local/bin/ && \
    rm -rf /tmp/croc

RUN adduser -h "/home/notroot" -g "unprivileged user" -s /bin/bash -u 1000 -D notroot notroot

COPY bashrc-cluster-id /bashrc-cluster-id

RUN echo "export CONTAINER=alpine" > /etc/container && \
    echo -e "source /etc/container\nsource /bashrc-cluster-id" >> /root/.bashrc && \
    echo -e "source /etc/container\nsource /bashrc-cluster-id" >> /home/notroot/.bashrc

ENTRYPOINT ["/bin/sleep"]
CMD ["24h"]
