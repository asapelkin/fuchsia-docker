FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

COPY packages.lst /tmp
RUN apt update && \
    apt -y install $(cat /tmp/packages.lst) && \
    useradd user && \
    mkhomedir_helper user && \
    groupadd -g 108 kvm && \
    usermod -a -G kvm user && \
    usermod -s /bin/bash user
USER user
WORKDIR /home/user

COPY setup-sdk.sh /tmp
RUN /tmp/setup-sdk.sh
WORKDIR /home/user/fuchsia-getting-started
