FROM alpine:3.18

LABEL maintainer="Jonathan Dyallo"
LABEL description="ARMv7 Alpine Linux image with http-server installed"

ARG PORT
ARG FOLDER

WORKDIR /app

RUN apk add --no-cache nodejs=18.18.2-r0 npm=9.6.6-r0 && \
    npm install -g http-server@14.1.1

EXPOSE ${PORT:-3500}

CMD ["http-server", "${FOLDER:-./data}", "-p", "${PORT:-3500}"]
