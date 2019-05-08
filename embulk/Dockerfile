FROM alpine:3.8

ENV LANG=ja_JP.UTF-8

# パッケージupdate & sudoインストール
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache sudo \
    vim \
    less \
    curl \
    git \ 
    expect \
    && rm -rf /var/cache/apk/*

ADD /.vimrc /root/
ADD .vim /root/.vim
RUN /root/.vim/expect.sh

RUN mkdir -p /vim
WORKDIR /vim

ENTRYPOINT ["vim"]
