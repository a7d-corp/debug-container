FROM ubuntu:bionic
MAINTAINER simon@simonweald.com

ENV PACKAGES="\
  sudo bash-completion vim jq ca-certificates openssl screen \
  dnsutils tcpdump curl nmap tcpflow iftop mtr-tiny netcat-openbsd bridge-utils iperf ngrep tcptraceroute \
  htop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

RUN apt-get update && \
    apt-get install -y $PACKAGES && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --home "/home/notroot" --gecos "unprivileged user" --disabled-password --disabled-login --shell /bin/bash -u 1000 notroot

ENTRYPOINT ["/bin/sleep"]
CMD ["2h"]
