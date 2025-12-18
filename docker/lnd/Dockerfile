# VERSION="v0.1.33-beta-lnd-v0.20.0-beta"
# docker build --build-arg VERSION=$VERSION -t vsyshost/lndinit:${VERSION} .
# docker push vsyshost/lndinit:${VERSION}

ARG VERSION="v0.1.33-beta-lnd-v0.20.0-beta"

FROM lightninglabs/lndinit:${VERSION}
COPY ./entrypoint.sh  /
ENTRYPOINT ["/entrypoint.sh"]
