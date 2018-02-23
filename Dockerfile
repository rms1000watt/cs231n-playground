FROM ubuntu:16.04
COPY requirements.txt /requirements.txt
RUN apt-get update &&\
    apt-get install \
        python3-dev \
        python3-numpy \
        python3-scipy \
        python3-pip \
        libfreetype6-dev \
        libpng-dev \
        libopenblas-dev -y && \
    pip3 install -r /requirements.txt
