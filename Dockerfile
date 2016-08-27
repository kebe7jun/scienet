FROM python:2.7.11

MAINTAINER KEBE <main@kebe7jun.com>

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN pip install scienet.tar.gz

RUN wget http://th.archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.24-0ubuntu1_amd64.deb\
    && wget http://th.archive.ubuntu.com/ubuntu/pool/universe/libs/libsodium/libsodium18_1.0.10-1_amd64.deb

RUN dpkg -i libc6_2.24-0ubuntu1_amd64.deb
RUN dpkg -i libsodium18_1.0.10-1_amd64.deb

EXPOSE 4123

CMD ["python", "run.py"]
