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


# FROM python:3.6.4-alpine3.7
# WORKDIR /assignment-1
# COPY requirements.txt /assignemnt-1/requirements.txt
# RUN apk add --no-cache pkgconfig freetype-dev py3-scipy py3-numpy && \
#     apk add --no-cache --virtual build-deps build-base            && \
# RUN apk --no-cache --update-cache add gcc gfortran python3-dev build-base wget freetype-dev libpng-dev openblas-dev &&\
#     ln -s /usr/include/locale.h /usr/include/xlocale.h            &&\
#     pip3 install -r /assignemnt-1/requirements.txt

# FROM python:3.6.4-slim-stretch
# COPY requirements.txt /requirements.txt
# RUN apt-get update                                                      && \
#     apt-get install build-essential python3-numpy python3-scipy python3-dev libfreetype6-dev libpng-dev libopenblas-dev -y && \
#     pip3 install -r /requirements.txt                      && \
#     apt-get remove build-essential

    

FROM alpine:latest
COPY requirements.txt /requirements.txt
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main/" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.6/community/" >> etc/apk/repositories \
    && apk add --no-cache \
        curl \
        musl-dev \
        bzip2-dev \
        gcc \
        g++ \
        libgcc \
        build-base \
        libstdc++ \
        libc-dev \
        make \
        readline-dev \
        tar \
        tk \
        tk-dev \
        vim \
        bash \
        python3 \
        python3-dev \
        libc6-compat \
        ncurses \
        ncurses-dev \
        libpng-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        freetype \
        freetype-dev \
        py-pillow \
        openblas-dev \
        gfortran \
        git \
        cmake \
        linux-headers \
    \
    && mkdir -p ~/.pip \
    && echo -e [global] "\n"\
       trusted-host =  mirrors.aliyun.com "\n"\
       index-url = http://mirrors.aliyun.com/pypi/simple "\n"\
       > ~/.pip/pip.conf \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir Pillow \
    \
    && mkdir /workdir && cd /workdir \
    && wget http://cs231n.stanford.edu/assignments/2017/spring1617_assignment1.zip \
    && wget http://cs231n.stanford.edu/assignments/2017/spring1617_assignment2.zip \
    && wget http://cs231n.stanford.edu/assignments/2017/spring1617_assignment3_v3.zip \
    && mv spring1617_assignment1.zip assignment1.zip \
    && mv spring1617_assignment2.zip assignment2.zip \
    && mv spring1617_assignment3_v3.zip assignment3.zip \
    && unzip assignment1.zip \
    && unzip assignment2.zip \
    && unzip assignment3.zip \
    \
    && pip3 install -r /requirements.txt \
    && git clone https://github.com/pytorch/pytorch \
    && cd pytorch \
    && git submodule update --init \
    && python3 setup.py install \
    && cd .. \
    && rm -rf pytorch
