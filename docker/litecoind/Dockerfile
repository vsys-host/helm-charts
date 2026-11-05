FROM ubuntu:focal

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

ARG LITECOIN_VERSION

RUN chmod +x walletnotify.sh \
    && curl -L https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz -o litecoin.tar.gz \
    && tar -xzvf litecoin.tar.gz \
    && cp litecoin-${LITECOIN_VERSION}/bin/litecoind litecoin-${LITECOIN_VERSION}/bin/litecoin-cli . \
    && rm -rf litecoin.tar.gz litecoin-${LITECOIN_VERSION}

CMD /shkeeper/litecoind \
    -prune=550 \
    -rpcpassword=$LTC_PASSWORD \
    -rpcuser=$LTC_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'

# LITECOIN_VERSION=0.21.2.2
# docker build --build-arg LITECOIN_VERSION=$LITECOIN_VERSION -t vsyshost/litecoind:$LITECOIN_VERSION .
