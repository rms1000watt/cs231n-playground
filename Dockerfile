# FROM python:3.6.4-alpine3.7
# WORKDIR /assignment-1
# COPY requirements.txt /assignemnt-1/requirements.txt
# RUN apk add --no-cache pkgconfig freetype-dev          && \
#     apk add --no-cache --virtual build-deps build-base && \
#     pip3 install -r /assignemnt-1/requirements.txt     && \
#     apk del build-deps

FROM python:3.6.4-slim-stretch
WORKDIR /assignment-1
COPY requirements.txt /assignemnt-1/requirements.txt
RUN apt-get update                                                      && \
    apt-get install build-essential python3-numpy python3-scipy -y      && \
    pip3 install -r /assignemnt-1/requirements.txt                      && \
    apt-get remove build-essential libncurses5-dev libncursesw5-dev

    # apt-get install build-essential libncurses5-dev libncursesw5-dev -y && \