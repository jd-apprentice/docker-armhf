FROM golang:alpine3.18 AS builder

RUN apk add --no-cache git=2.40.1-r0 make=4.4.1-r1 gcc=12.2.1_git20220924-r10 musl-dev=1.2.4-r2 binutils-gold=2.40-r7 && \
    rm -rf /var/cache/apk/*

COPY . /app
WORKDIR /app

RUN git clone https://github.com/jd-apprentice/krakend-ce.git && \
    cd krakend-ce && \
    make build

FROM alpine:3.18 as runner

RUN apk add --no-cache ca-certificates tzdata && \
    adduser -u 1000 -S -D -H krakend && \
    mkdir /etc/krakend && \
    echo '{ "version": 3 }' > /etc/krakend/krakend.json

COPY --from=builder /app/krakend /usr/bin/krakend

USER 1000

WORKDIR /etc/krakend

ENTRYPOINT ["/usr/bin/krakend"]
CMD ["run", "-c", "/etc/krakend/krakend.json"]

EXPOSE 8080 8090