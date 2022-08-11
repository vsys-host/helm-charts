FROM ubuntu:focal

RUN apt update -y && apt install curl -y

WORKDIR /shkeeper

COPY ./walletnotify.sh .

RUN chmod +x walletnotify.sh \
    && curl -L https://github.com/dogecoin/dogecoin/releases/download/v1.14.5/dogecoin-1.14.5-x86_64-linux-gnu.tar.gz -o dogecoin.tar.gz \
    && tar -xzvf dogecoin.tar.gz \
    && cp dogecoin-1.14.5/bin/dogecoind dogecoin-1.14.5/bin/dogecoin-cli . \
    && rm -rf dogecoin.tar.gz dogecoin-1.14.5

CMD /shkeeper/dogecoind \
    -prune=2200 \
    -printtoconsole \
    -rpcpassword=$DOGE_PASSWORD \
    -rpcuser=$DOGE_USERNAME \
    -rpcbind=0.0.0.0 \
    -rpcallowip=0.0.0.0/0 \
    -wallet=shkeeper \
    -walletnotify='/shkeeper/walletnotify.sh %s'