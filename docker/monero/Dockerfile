# MONERO_VERSION=v0.18.1.2
# docker build --build-arg MONERO_VERSION=$MONERO_VERSION -t vsyshost/monero:$MONERO_VERSION .
# docker push vsyshost/monero:$MONERO_VERSION

FROM ubuntu:focal

ARG MONERO_VERSION

RUN apt update -y && apt install curl -y

WORKDIR /monero

COPY ./walletnotify.sh .
COPY ./start-monero-wallet-rpc.sh .

RUN  curl https://downloads.getmonero.org/cli/monero-linux-x64-${MONERO_VERSION}.tar.bz2 -o monero-linux-x64-${MONERO_VERSION}.tar.bz2 \
     && tar -xjvf monero-linux-x64-${MONERO_VERSION}.tar.bz2 \
     && cp monero-x86_64-linux-gnu-${MONERO_VERSION}/* /monero \
     && rm monero-linux-x64-${MONERO_VERSION}.tar.bz2 \
     && rm -r monero-x86_64-linux-gnu-${MONERO_VERSION}
