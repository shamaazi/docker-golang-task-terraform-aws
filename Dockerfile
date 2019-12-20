FROM golang:1.13-alpine

RUN apk add --update \
        build-base \
        git \
        openssh \
        zip \
        bash \
        curl \
        jq

RUN apk add \
        python3 \
        python3-dev \
        py3-pip \
        nodejs \
        npm

ENV GO111MODULE=on

ENV TERRAFORM_VERSION=v0.12.18

RUN pip3 install awscli

RUN go get github.com/hashicorp/terraform@${TERRAFORM_VERSION}

RUN go get github.com/go-task/task/v2/cmd/task

RUN go get github.com/terraform-linters/tflint

RUN curl -o /usr/bin/do-exclusively \
        https://raw.githubusercontent.com/shamaazi/circle-lock-test/master/do-exclusively \
        && chmod +x /usr/bin/do-exclusively


WORKDIR /root
