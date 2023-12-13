# docker run -it --rm --privileged tonistiigi/binfmt --install all
FROM alpine:3.18

ARG ASSET=ce
ARG KONG_VERSION=3.5.0
ARG EE_PORTS
ENV ASSET=ce
ENV KONG_VERSION=3.5.0

RUN apk add --no-cache git=2.40.1-r0 make=4.4.1-r1 lua5.3=5.3.6-r5 curl=8.5.0-r0 && \
    rm -rf /var/cache/apk/*

WORKDIR /app

RUN git clone https://github.com/Kong/kong.git && \
    cd kong && \
    make install

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8001 8443 8444

STOPSIGNAL SIGQUIT

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "kong health" ]

CMD ["kong", "docker-start"]