FROM alpine3.8

LABEL maintainer="kwf2030 <kwf2030@163.com>" \
      version=0.1.0

RUN echo http://mirrors.aliyun.com/alpine/v3.8/main > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.8/community >> /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git nodejs yarn && \
    yarn global add http-server && \
    mkdir -p /hiprice/web

WORKDIR /hiprice

RUN git clone https://github.com/kwf2030/hiprice-web.git src

ENV CHATBOT_SERVER=127.0.0.1

WORKDIR /hiprice/src

RUN yarn install && \
    yarn run build && \
    cp -r dist/. /hiprice/web/

WORKDIR /hiprice/web

RUN mv index.html watchlist && \
    mv static/favicon.ico ../

ENV HOST=0.0.0.0 \
    PORT=8080

WORKDIR /hiprice

ENTRYPOINT ["/bin/sh", "-c", "http-server", "-a", "$HOST", "-p", "$PORT"]
