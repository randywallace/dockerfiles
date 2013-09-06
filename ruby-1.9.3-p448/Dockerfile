########
#
# Dockerfile which sets up a ruby-1.9.3-p448 installation (this is the latest patch)
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libyaml-dev libssl-dev libreadline-dev libgdbm-dev libffi-dev libncurses-dev bison

RUN mkdir /ruby-src
ADD https://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz /ruby-src/ruby.tar.gz
RUN cd /ruby-src && tar xvvf ruby.tar.gz && rm ruby.tar.gz
RUN cd /ruby-src/ruby-* && ./configure && make && make install
RUN cd / && rm -rf /ruby-src
RUN ruby -e 'puts "Successfully installed ruby " + RbConfig::CONFIG["ruby_version"] + "-" + RbConfig::CONFIG["PATCHLEVEL"]'