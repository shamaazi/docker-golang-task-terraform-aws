FROM golang:1.13-alpine

RUN apk add --update \
        git \
        python3 \
        python3-dev \
        py3-pip \
        build-base \
        terraform 

RUN pip3 install awscli

RUN git clone --depth=1 https://github.com/go-task/task /tmp/task \
    && cd /tmp/task/cmd/task \
    && go install \
    && rm -rf /tmp/task

RUN git clone --depth=1 https://github.com/wata727/tflint /tmp/tflint \
    && cd /tmp/tflint \
    && go mod vendor \
    && go install \
    && rm -rf /tmp/tflint

WORKDIR /root
