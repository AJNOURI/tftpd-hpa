FROM phusion/baseimage:0.9.22

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y tftpd-hpa \
curl htop iftop \
iperf iptraf iputils-tracepath \
links mtr nano nmap rsync \
socat vim wget

RUN mkdir /etc/sv/tftpd
ADD tftpd-run /etc/sv/tftpd/run
RUN chmod a+x /etc/sv/tftpd/run
RUN ln -s /etc/sv/tftpd /etc/service

