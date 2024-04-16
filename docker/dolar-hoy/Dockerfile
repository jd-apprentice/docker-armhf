## https://stackoverflow.com/questions/56048631/docker-alpine-error-loading-mysqldb-module
## https://stackoverflow.com/questions/7475223/mysql-config-not-found-when-installing-mysqldb-python-interface
## https://stackoverflow.com/questions/53204916/what-is-the-meaning-of-failed-building-wheel-for-x-in-pip-install

FROM python:alpine3.18

LABEL maintainer="Jonathan Dyallo"
LABEL description="ARM64 Alpine Linux for Dolar Hoy Api."

ARG PORT

WORKDIR /app

RUN apk add --no-cache \
    mariadb-connector-c-dev=3.3.5-r0 \
    gcc=12.2.1_git20220924-r10 \
    musl-dev=1.2.4-r2 \
    mariadb-dev=10.11.6-r0 \
    unzip=6.0-r14 wget=1.21.4-r0 && \
    rm -rf /var/cache/apk/*

RUN wget https://github.com/jd-apprentice/dolar-hoy-api/archive/refs/heads/master.zip && \
    unzip master.zip

RUN mv dolar-hoy-api-master app && \
    rm -rf master.zip

RUN cd app && \
    pip install --no-cache-dir \
    wheel==0.43.0 \
    beautifulsoup4==4.12.2 \
    bs4==0.0.1 \
    fastapi==0.109.1 \
    python-dotenv==1.0.0 \
    uvicorn==0.22.0 \
    mysqlclient==2.1.1 \
    requests==2.31.0

EXPOSE ${PORT:-4500}

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4500"]