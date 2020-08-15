FROM ubuntu:bionic
MAINTAINER simon@simonweald.com

ENV PACKAGES="\
  sudo bash-completion vim jq ca-certificates openssl screen \
  dnsutils tcpdump curl nmap tcpflow iftop mtr-tiny netcat-openbsd bridge-utils iperf ngrep tcptraceroute telnet iproute2 iputils-ping wget \
  htop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

RUN apt-get update && \
    apt-get install -y $PACKAGES && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --home "/home/notroot" --gecos "unprivileged user" --disabled-password --disabled-login --shell /bin/bash -u 1000 notroot

COPY bashrc-cluster-id /bashrc-cluster-id

RUN echo "export CONTAINER=ubuntu" > /etc/container && \
    echo "source /etc/container\nsource /bashrc-cluster-id" >> /root/.bashrc && \
    echo "source /etc/container\nsource /bashrc-cluster-id" >> /home/notroot/.bashrc

ENTRYPOINT ["/bin/sleep"]
CMD ["2h"]
