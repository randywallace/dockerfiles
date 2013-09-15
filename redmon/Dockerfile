######
#
# Install and run redmon, a Redis Webinterface
#
######

FROM ruby-1.9.3

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN gem install redmon

ENTRYPOINT ["redmon"]

CMD ["-h"]

EXPOSE 4567