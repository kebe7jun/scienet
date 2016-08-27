FROM python:2.7.11

MAINTAINER KEBE kebe <main@kebe7jun.com>

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN pip install scienet.tar.gz

RUN wget http://cn.archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.24-0ubuntu1_amd64.deb\
    && wget http://cn.archive.ubuntu.com/ubuntu/pool/universe/libs/libsodium/libsodium18_1.0.10-1_amd64.deb

RUN dpkg -i libc6_2.24-0ubuntu1_amd64.deb
RUN dpkg -i libsodium18_1.0.10-1_amd64.deb

RUN cp /app/run.py /usr/bin
RUN rm -rf /app

WORKDIR /

EXPOSE 4123

CMD ["python", "/usr/bin/run.py"]
