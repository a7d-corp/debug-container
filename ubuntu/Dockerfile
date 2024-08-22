FROM ubuntu:noble
MAINTAINER simon@simonweald.com

ENV PACKAGES="\
  sudo bash-completion vim jq ca-certificates openssl screen \
  dnsutils tcpdump curl nmap tcpflow iftop mtr-tiny netcat-openbsd bridge-utils iperf ngrep tcptraceroute telnet iproute2 iputils-ping wget \
  htop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv wormhole-william"

ENV REMOVE_USERS="\
games \
news \
proxy \
www-data \
backup \
list \
irc \
ubuntu"

RUN apt-get update && \
    apt-get install -y $PACKAGES --no-install-recommends && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN for user in $REMOVE_USERS; do userdel --force --remove $user ; done && \
    adduser --home "/home/notroot" --gecos "unprivileged user" --disabled-password --disabled-login --shell /bin/bash -u 1000 notroot

COPY bashrc-cluster-id /bashrc-cluster-id

RUN echo "export CONTAINER=ubuntu" > /etc/container && \
    echo "source /etc/container\nsource /bashrc-cluster-id" >> /root/.bashrc && \
    echo "source /etc/container\nsource /bashrc-cluster-id" >> /home/notroot/.bashrc

ENTRYPOINT ["/bin/sleep"]
CMD ["24h"]
