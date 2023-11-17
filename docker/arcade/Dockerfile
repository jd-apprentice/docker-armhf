FROM alpine:3.18

LABEL maintainer="Jonathan Dyallo"
LABEL description="ARMv7 Alpine Linux image with serve installed"

ARG PORT
ARG FOLDER

WORKDIR /app

RUN apk add --no-cache nodejs=18.18.2-r0 npm=9.6.6-r0 && \
    npm install -g serve@14.2.1

EXPOSE ${PORT:-3000}

CMD ["serve", "-s", "${FOLDER:-page}", "-l", "${PORT:-3000}"]