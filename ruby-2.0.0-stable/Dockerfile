########
#
# Dockerfile which sets up the latest stable ruby-2.0.0 installation
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr.

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libssl-dev libreadline-dev libgdbm-dev libffi-dev libncurses-dev bison

RUN mkdir /ruby-src
ADD https://ftp.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz /ruby-src/stable-snapshot.tar.gz
RUN cd /ruby-src && tar xvvf stable-snapshot.tar.gz && rm stable-snapshot.tar.gz
RUN cd /ruby-src/ruby-* && ./configure && make && make install
RUN cd / && rm -rf /ruby-src
RUN ruby -e 'puts "Successfully installed ruby " + RbConfig::CONFIG["ruby_version"] + "-" + RbConfig::CONFIG["PATCHLEVEL"]'