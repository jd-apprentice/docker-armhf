# Based on https://hub.docker.com/r/keinos/sqlite3
FROM alpine:latest as builder

RUN \
    apk update && \
    apk upgrade && \
    apk add \
    sqlite && \
    rm -rf /var/cache/apk/*

FROM alpine:latest AS runner

COPY --from=builder /usr/bin/sqlite3 /usr/bin/sqlite3

ENV USER_SQLITe=sqlite \
    GROUP_SQLITE=sqlite

RUN addgroup -S ${GROUP_SQLITE} && \
    adduser -S ${USER_SQLITE} -G ${GROUP_SQLITE} && \
    apk --no-cache upgrade

USER ${USER_SQLITE}

CMD /usr/bin/sqlite3

HEALTHCHECK \
    --interval=10m \
    --timeout=3s \
    --start-period=1m \
    --retries=3 CMD [ "/usr/bin/sqlite3", "--version", "||", "exit", "1" ]