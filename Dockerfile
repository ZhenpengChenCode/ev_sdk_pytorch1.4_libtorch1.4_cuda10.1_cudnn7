From pytorch/pytorch:1.4-cuda10.1-cudnn7-devel

LABEL maintainer="chenzpbj@hotmail.com"

RUN apt-get update && apt-get install -y wget vim unzip zip curl cmake tzdata && rm -rf /var/lib/apt/lists/*

RUN cd /opt &&  \
    wget -O libtorch_1.4.0.zip https://download.pytorch.org/libtorch/cu101/libtorch-shared-with-deps-1.4.0.zip && \
    unzip libtorch_1.4.0.zip && \
    rm libtorch_1.4.0.zip

# change timezone
RUN ln -sf /usr/share/zoneinfo/Turkey /etc/localtime

WORKDIR /opt/libtorch

RUN mkdir -p /home/ev_sdk

RUN git clone https://github.com/ExtremeMart/dev-docs.git