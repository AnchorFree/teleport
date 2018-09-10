FROM golang:1.10-stretch as builder
LABEL maintainer="v.zorin@anchorfree.com"

COPY . /go/src/github.com/gravitational/teleport
RUN apt-get update && apt-get install -y zip
RUN cd /go/src/github.com/gravitational/teleport && make full
RUN cp -r /go/src/github.com/gravitational/teleport/build /
ENTRYPOINT ["/bin/sh"]
