FROM ubuntu:focal

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

ARG BITCOIN_VERSION

RUN chmod +x walletnotify.sh \
    && curl -L https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz -o bitcoin.tar.gz \
    && tar -xzvf bitcoin.tar.gz \
    && cp bitcoin-${BITCOIN_VERSION}/bin/bitcoind bitcoin-${BITCOIN_VERSION}/bin/bitcoin-cli . \
    && rm -rf bitcoin.tar.gz bitcoin-${BITCOIN_VERSION}

CMD /shkeeper/bitcoind \
    -prune=550 \
    -rpcpassword=$BTC_PASSWORD \
    -rpcuser=$BTC_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'

# BITCOIN_VERSION=27.0
# docker build --build-arg BITCOIN_VERSION=$BITCOIN_VERSION -t vsyshost/bitcoind:$BITCOIN_VERSION .