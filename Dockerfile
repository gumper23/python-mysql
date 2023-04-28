FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC set -x && \
    apt update && \
    apt install -y systemd tzdata software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install -y python3.11 vim wget curl && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.18-1_all.deb && \
    dpkg -i mysql-apt-config* && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 && \
    apt update && \
    apt install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*
