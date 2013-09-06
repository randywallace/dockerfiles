######
#
# Dockerfile build for doozerd 
#
# http://github.com/ha/doozerd
#
######

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:duh/golang
RUN apt-get update
RUN apt-get install -y golang mercurial git
RUN apt-get upgrade -y

RUN mkdir /go
ENV GOPATH /go
ENV PATH /go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN go get github.com/ha/doozerd

# Let's just see the webview for now
EXPOSE 8080

# Change this for actual use
ENTRYPOINT ["/go/bin/doozerd", "-w", "0.0.0.0:8080"]
