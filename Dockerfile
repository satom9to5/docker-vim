FROM alpine:3.8

ENV LANG=C.UTF-8

# パッケージupdate & sudoインストール
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache sudo \
    vim \
    less \
    curl \
    git \ 
    && rm -rf /var/cache/apk/*

RUN mkdir -p /vim
WORKDIR /vim
