FROM oracle-java-7
MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.3.tar.gz /opt/elasticsearch.tar.gz
RUN cd /opt && tar xvvf elasticsearch.tar.gz && rm -f elasticsearch.tar.gz && mv elasticsearch-0.90.3 elasticsearch
ENV ES_CLASSPATH /opt/elasticsearch/lib
RUN cd /opt/elasticsearch && bin/plugin --install mobz/elasticsearch-head && bin/plugin --install lukas-vlcek/bigdesk

# Start ElasticSearch
CMD /opt/elasticsearch/bin/elasticsearch -f
