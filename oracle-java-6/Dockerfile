########
#
# Dockerfile which sets up a working oracle java 6 installation
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr.

RUN apt-get update && apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get upgrade -y
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java6-installer oracle-java6-set-default
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle