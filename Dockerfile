FROM ubuntu:18.04

RUN apt-get update -y && apt-get install -y \
    curl \
    gnupg2 \
    openssh-server \ 
    sshpass

RUN curl https://install.husarnet.com/install.sh | bash

COPY ./husarnet-docker.sh /usr/bin/husarnet-docker

RUN chmod +x /usr/bin/husarnet-docker && \
    useradd -rm -d /home/ubuntu -g root -G sudo -s /bin/bash -u 123 ubuntu && \
    echo 'ubuntu:ubuntu' | chpasswd && \
    echo "You're in!" > /etc/motd && \
    mkdir -p -m 0755 /var/run/sshd

ENV HOSTNAME=husarnet

EXPOSE 22

CMD husarnet-docker