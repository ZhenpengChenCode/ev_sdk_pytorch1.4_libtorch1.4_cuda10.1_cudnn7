From pytorch/pytorch:1.4-cuda10.1-cudnn7-devel

LABEL maintainer="chenzpbj@hotmail.com"

RUN apt-get update && apt-get install -y wget vim unzip zip curl cmake && rm -rf /var/lib/apt/lists/*

RUN cd /opt &&  \
    wget -O libtorch_1.4.0.zip https://download.pytorch.org/libtorch/cu101/libtorch-shared-with-deps-1.4.0.zip && \
    unzip libtorch_1.4.0.zip && \
    rm libtorch_1.4.0.zip

# change timezone
#RUN ln -sf /usr/share/zoneinfo/Turkey /etc/localtime

RUN mkdir -p /home/ev_sdk

WORKDIR /home/ev_sdk

RUN git clone https://github.com/ExtremeMart/dev-docs.git


RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

RUN apt install python-pip
RUN apt install python3-pip
