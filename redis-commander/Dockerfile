FROM ubuntu:12.04
MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>
RUN                                                                                          \
  echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list ;\
  apt-get update                                                                            ;\
  apt-get -y upgrade                                                                        ;\
  apt-get install -y python-software-properties                                             ;\
  add-apt-repository ppa:chris-lea/node.js                                                  ;\
  apt-get update                                                                            ;\
  apt-get install -y nodejs                                                                 ;\
#RUN

RUN npm install -g redis-commander
EXPOSE 8081
ENTRYPOINT ["/usr/bin/redis-commander"]
