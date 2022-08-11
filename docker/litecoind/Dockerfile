FROM ubuntu:focal

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

RUN chmod +x walletnotify.sh \
    && curl -L https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz -o litecoin.tar.gz \
    && tar -xzvf litecoin.tar.gz \
    && cp litecoin-0.18.1/bin/litecoind litecoin-0.18.1/bin/litecoin-cli . \
    && rm -rf litecoin.tar.gz litecoin-0.18.1

CMD /shkeeper/litecoind \
    -prune=550 \
    -rpcpassword=$LTC_PASSWORD \
    -rpcuser=$LTC_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'