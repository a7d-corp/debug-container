FROM alpine:3.10.1
MAINTAINER simon@simonweald.com

ENV PACKAGES="\
  busybox-extras bash bash-completion ncurses vim jq ca-certificates openssl screen \
  bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep \
  htop atop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

RUN apk add --no-cache $PACKAGES

ENTRYPOINT ["/bin/bash"]
