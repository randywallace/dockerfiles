FROM oracle-java:7u40
# See Oracle Java 7 Dockerfile in this repo for the FROM image above.  
#
# If you use a different java 7 image, make sure JAVA_HOME is set
#
# Installs river-jdbc 2.0.2, head, and bigdesk plugins as well
#

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.tar.gz /opt/elasticsearch.tar.gz

RUN \
  cd /opt ;\
  tar xf elasticsearch.tar.gz ;\
  rm elasticsearch.tar.gz ;\
  mv elasticsearch-* elasticsearch ;\
  rm elasticsearch/config/elasticsearch.yml ;\
#RUN

ADD run_elasticsearch.sh /opt/elasticsearch/bin/run_elasticsearch.sh

WORKDIR /opt
RUN  \
  /opt/elasticsearch/bin/plugin --url http://bit.ly/19iNdvZ -install river-jdbc ;\
  /opt/elasticsearch/bin/plugin --install mobz/elasticsearch-head ;\
  /opt/elasticsearch/bin/plugin --install lukas-vlcek/bigdesk ;\
  apt-get install wget ;\
  wget -c http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.26.tar.gz/from/http://cdn.mysql.com/ -O mysql-connector.tar.gz ;\
  tar xf mysql-connector.tar.gz ;\
  mv mysql-connector-* mysql-connector-java ;\
  mv mysql-connector-java/mysql-connector-java-*.jar elasticsearch/plugins/river-jdbc/ ;\
#RUN

EXPOSE :9200
EXPOSE :9300

VOLUME ["/data"]
WORKDIR /opt/elasticsearch/bin
ENTRYPOINT ["/opt/elasticsearch/bin/run_elasticsearch.sh"]
