FROM debian:buster


COPY . .

RUN apt update \
  && apt upgrade -y \
  && apt install -y git \
  && apt install -y autoconf build-essential \
  && apt install -y libiso9660-dev libcdio-dev libvcdinfo-dev libboost-all-dev \
\
  && ./bootstrap \
  && ./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu LDFLAGS="-static" LIBS="-lpthread" \
  && make \
  && cp src/psxbuild src/psxinject src/psxrip /usr/local/bin/


WORKDIR /psximager
