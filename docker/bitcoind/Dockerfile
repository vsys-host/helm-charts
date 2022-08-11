FROM ubuntu:focal

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

RUN chmod +x walletnotify.sh \
    && curl -L https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz -o bitcoin.tar.gz \
    && tar -xzvf bitcoin.tar.gz \
    && cp bitcoin-22.0/bin/bitcoind bitcoin-22.0/bin/bitcoin-cli . \
    && rm -rf bitcoin.tar.gz bitcoin-22.0

CMD /shkeeper/bitcoind \
    -prune=550 \
    -rpcpassword=$BTC_PASSWORD \
    -rpcuser=$BTC_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'