FROM alpine:3.10.1
MAINTAINER simon@simonweald.com

ENV PACKAGES="\
  sudo busybox-extras bash bash-completion ncurses vim jq ca-certificates openssl screen \
  bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep tcptraceroute \
  htop atop strace iotop ltrace ncdu hdparm pciutils psmisc tree pv"

RUN apk add --no-cache $PACKAGES

RUN /usr/sbin/setcap 'cap_net_bind_service=ep' /usr/sbin/tcpdump && \
    echo "nobody ALL=(ALL) NOPASSWD: /usr/sbin/tcpdump" > /etc/sudoers.d/01_tcpdump && \
    chmod 0440 /etc/sudoers.d/01_tcpdump

RUN adduser -h "/home/notroot" -g "unprivileged user" -s /bin/bash -u 1000 -D notroot notroot

ENTRYPOINT ["/bin/sleep"]
CMD ["2h"]
