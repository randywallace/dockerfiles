#!/bin/bash

read -r -d '' USAGE <<EOF
Usage for $0

  -n Cluster Name 
     Default: elasticsearch

  -m Whether or not this elasticsearch instance can be a master (true/false)
     Default: false

  -d Whether or not this elasticsearch instance can hold index data (true/false)
     Default: false
     
  -p Publish Host IP (the IP reported by ZEN)
     Default: 127.0.0.1

  -h Hostname for a Logstash Master
     Default: 127.0.0.1

  -s Heap Size
     Default 1G

EOF

while getopts "hn:m:d:p:u:s:" OPTION; do
  case $OPTION in
    h)
      echo "$USAGE"
      exit 0
    ;;
    n)
      CLUSTER_NAME=${OPTARG}
    ;;
    m)
      NODE_MASTER=${OPTARG}
    ;;
    d)
      NODE_DATA=${OPTARG}
    ;;
    p)
      NETWORK_PUBLISH_HOST=${OPTARG}
    ;;
    u)
      MASTER_HOST=${OPTARG}
    ;;
    s)
      ES_HEAP_SIZE=${OPTARG}
    ;;
  esac
done

CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch}
NODE_MASTER=${NODE_MASTER:-false}
NODE_DATA=${NODE_DATA:-false}
NETWORK_PUBLISH_HOST=${NETWORK_PUBLISH_HOST:-127.0.0.1}
MASTER_HOST=${MASTER_HOST:-127.0.0.1}
ES_HEAP_SIZE=${ES_HEAP_SIZE:-1G}

cat <<EOF > /opt/elasticsearch/config/elasticsearch.yml
cluster.name: ${CLUSTER_NAME}
node.master: ${NODE_MASTER}
node.data: ${NODE_DATA}
network.publish_host: ${NETWORK_PUBLISH_HOST}
discovery.zen.ping.multicast.enabled: false
discovery.zen.ping.unicast.hosts: ["${MASTER_HOST}"]
path.data: /data
EOF

export ES_HEAP_SIZE

ulimit -Sn
ulimit -Hn
/opt/elasticsearch/bin/elasticsearch -f -Des.max-open-files=true
