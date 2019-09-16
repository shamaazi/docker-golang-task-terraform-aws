FROM golang:1-alpine

RUN apk add --update \
        git \
        python3 \
        python3-dev \
        py3-pip \
        build-base \
        terraform \
    && pip3 install awscli \
    && rm -rf /var/cache/apk/*

RUN go get github.com/go-task/task/cmd/task

RUN go get github.com/wata727/tflint

WORKDIR /root
