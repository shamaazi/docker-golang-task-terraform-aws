FROM golang:1.13-alpine

RUN apk add --update \
        git \
        openssh \
        python3 \
        python3-dev \
        py3-pip \
        build-base \
        zip \
        nodejs \
        npm

ENV GO111MODULE=on

ENV TERRAFORM_VERSION=v0.12.18

RUN pip3 install awscli

RUN go get github.com/hashicorp/terraform@${TERRAFORM_VERSION}

RUN go get github.com/go-task/task/v2/cmd/task

RUN go get github.com/terraform-linters/tflint

WORKDIR /root
