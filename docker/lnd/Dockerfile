# LNDINIT_VERSION="v0.1.22-beta"
# LND_VERSION="v0.18.3-beta"
# docker build --build-arg LNDINIT_VERSION=$LNDINIT_VERSION --build-arg LND_VERSION=$LND_VERSION -t vsyshost/lndinit:${LNDINIT_VERSION}-lnd-${LND_VERSION} .
# docker push vsyshost/lndinit:${LNDINIT_VERSION}-lnd-${LND_VERSION}

ARG LNDINIT_VERSION="v0.1.22-beta"
ARG LND_VERSION="v0.18.3-beta"

FROM lightninglabs/lndinit:${LNDINIT_VERSION}-lnd-${LND_VERSION}
COPY ./entrypoint.sh  /
ENTRYPOINT ["/entrypoint.sh"]