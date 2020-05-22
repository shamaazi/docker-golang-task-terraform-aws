FROM golang:1.13-alpine

RUN apk add --no-cache --update \
        build-base \
        git \
        openssh \
        zip \
        bash \
        curl \
        jq \
        python3 \
        python3-dev \
        py3-pip \
        nodejs \
        npm

ENV GO111MODULE=on

ENV TERRAFORM_VERSION=v0.12.25

RUN pip3 install --no-cache-dir awscli

RUN go get github.com/hashicorp/terraform@${TERRAFORM_VERSION} && \
    go get github.com/go-task/task/v2/cmd/task && \
    go get github.com/terraform-linters/tflint && \
    rm -rf $GOPATH/pkg && \
    rm -rf /root/.cache

RUN curl -o /usr/bin/do-exclusively \
        https://raw.githubusercontent.com/shamaazi/circle-lock-test/master/do-exclusively \
        && chmod +x /usr/bin/do-exclusively

WORKDIR /root
