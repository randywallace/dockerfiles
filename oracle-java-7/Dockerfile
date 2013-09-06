########
#
# Dockerfile which sets up a working oracle java 7 installation
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get upgrade -y
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer oracle-java7-set-default
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle