########
#
# Dockerfile which sets up a zookeeper instance
#
########

FROM oracle-java-6

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

ADD http://mirror.reverse.net/pub/apache/zookeeper/stable/zookeeper-3.4.5.tar.gz /opt/zookeeper.tar.gz
RUN cd /opt && tar xvvf /opt/zookeeper.tar.gz && rm -f /opt/zookeeper.tar.gz
ADD zoo.cfg /opt/zookeeper-3.4.5/conf/zoo.cfg
RUN chmod +x /opt/zookeeper-3.4.5/bin/zkServer.sh

ENTRYPOINT ["/opt/zookeeper-3.4.5/bin/zkServer.sh"]
CMD ["start"]

EXPOSE 2181