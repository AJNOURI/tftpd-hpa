FROM debian:jessie

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    tftpd-hpa \
    curl htop iftop \
    iperf iptraf iputils-tracepath \
    links mtr nano nmap rsync \
    socat vim wget net-tools iproute2 iputils-ping git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir /root/data
RUN chmod 777 /root/data
RUN mkdir /root/data/null
RUN chmod 777 /root/data/null

ADD RouterInitTemplate.cfg /root/data/null

VOLUME /root /mnt

CMD in.tftpd -L --user tftp -a 0.0.0.0:69 -s -c -B1468 -v /root/data
