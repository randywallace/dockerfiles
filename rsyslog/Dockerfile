FROM ubuntu:14.04
MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get -y update
RUN apt-get -y install rsyslog supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME /dev/log /dev/log
CMD ["/usr/bin/supervisord"]
