# https://stackoverflow.com/questions/52056387/how-to-install-go-in-alpine-linux
FROM golang:alpine3.18 AS deps
FROM alpine:3.18 as runner

LABEL maintainer="Jonathan Dyallo"
LABEL description="ARMv7 Alpine Linux image for the turso CLI tool"

WORKDIR /turso

RUN apk add --no-cache git=2.40.1-r0 && \
    rm -rf /var/cache/apk/*

COPY --from=deps /usr/local/go /usr/local/go
ENV PATH=$PATH:/usr/local/go/bin

RUN git clone https://github.com/tursodatabase/turso-cli.git
RUN cd turso-cli/cmd/turso && go install

ENTRYPOINT ["/turso/go/bin/turso"]

