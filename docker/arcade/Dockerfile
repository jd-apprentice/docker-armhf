FROM alpine:3.18

LABEL maintainer="Jonathan Dyallo"
LABEL description="ARMv7 Alpine Linux image with my personal arcade"

ARG PORT

WORKDIR /app

RUN apk add --no-cache nodejs=18.18.2-r0 npm=9.6.6-r0 unzip=6.0-r14 wget=1.21.4-r0 && \
    npm install -g serve@14.2.1 && \
    rm -rf /var/cache/apk/*

RUN wget https://github.com/jd-apprentice/arcade/archive/refs/heads/main.zip && \
    unzip arcade-main.zip

RUN mv arcade-main app && \
    rm -rf arcade-main.zip

EXPOSE ${PORT:-3000}

CMD ["serve", "-s", "app", "-l", "${PORT:-3000}"]