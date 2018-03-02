# CS231n Playground

## Introduction

This is homework for Stanford's CS231n class: https://www.youtube.com/playlist?list=PLC1qU-LWwrF64f4QKQT-Vg5Wr4qEE1Zxk

Here is the course website: http://cs231n.github.io/

## Contents

- [Install](#install)
- [Build](#build)
- [Run](#run)

## Install

```bash
brew install wget docker
```

## Build

This is optional; this is if you want to build from source. You can skip this step and the docker image will be downloaded at runtime.

```bash
docker build --no-cache --compress --force-rm -t rms1000watt/cs231n-python:latest .
docker tag rms1000watt/cs231n-python:latest rms1000watt/cs231n-python:$(date +'%Y%m%d%H%M%S')
```

## Run

Download Datasets:

```bash
cd assignment-1/cs231n/datasets
./get_datasets.sh
cd ../../..
```

Start Assignment 1:

```bash
docker run -it --rm -v $(pwd):/cs231n -w /cs231n/assignment-1 -p 8888:8888 rms1000watt/cs231n-python jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token=''
```

Then open http://127.0.0.1:8888 in your browser

If you just want a dockerized Python environment for local work, run:

```bash
docker run -it --rm -v $(pwd):/cs231n -w /cs231n rms1000watt/cs231n-python bash
```
