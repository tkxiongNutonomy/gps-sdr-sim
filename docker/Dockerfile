FROM ubuntu:16.04

MAINTAINER Kai Xiong <legendarykx.kaixiong1@gmail.com>

#install basictools
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    apt-utils \
    sudo \
    rsync \
    vim \
    net-tools \
    iperf \
    module-init-tools \
    git \
    build-essential \
    libxml2 \
    libxml2-dev \
    bison \
    flex \
    libcdk5-dev \
    cmake \
    libaio-dev \
    libusb-1.0-0-dev \
    libserialport-dev \
    libxml2-dev \
    libavahi-client-dev \
    doxygen \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

ARG homeDir=/home/gps

# create a user
ARG user=gps
ARG group=gps
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group} \
    && useradd -d ${homeDir} -u ${uid} -g ${gid} -m -s /bin/bash ${user}

# requires SUDO package to be installed
RUN echo "${user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sudoers_gps

RUN mkdir -p ${homeDir}/bin
RUN mkdir -p ${homeDir}/config

WORKDIR ${homeDir}
USER gps

RUN git clone https://github.com/analogdevicesinc/libiio.git && cd libiio && cmake . && make all && sudo make install && cd ~
RUN git clone https://github.com/analogdevicesinc/libad9361-iio.git && cd libad9361-iio && cmake . && make all && sudo make install && cd ~

COPY build/start.sh ${homeDir}/bin
COPY build/gps-sdr-sim ${homeDir}/bin
COPY build/plutoplayer ${homeDir}/bin
COPY build/brdc3540.14n ${homeDir}/config

ENV PATH ${homeDir}/bin:${PATH}
RUN sudo ldconfig

ENTRYPOINT []
CMD ["start.sh"]