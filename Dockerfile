FROM python:3.6.4-slim-stretch
COPY requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
