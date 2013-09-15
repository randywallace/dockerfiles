#!/bin/bash
#
# Run a working elasticsearch cluster
#
# Running this script without arguments will start (1) Elasticsearch server.
#
# Running with a #, i.e. start_cluster.sh 10, will start that number of elasticsearch 
# servers with incrementing port #'s. The first server will have a port # 9200, with
# each server receiving the next incremental number, 9201, 9202, etc...
#
set -e

IMAGE_TAG=elasticsearch:latest
#MUST BE IN BYTES...
MEMORY=1073741824
#DEFAULT CPU SHARE: Will force all servers in cluster to get a equal share of CPU
CPU=1024

if (( $# == 0 )); then
  echo $(docker run -c ${CPU} -m ${MEMORY} -e ES_HEAP_SIZE=${MEMORY} -d -p 9200:9200 ${IMAGE_TAG})
else
  COUNT=$(expr ${1} - 1)
  for NUM in $(seq -w 00 ${COUNT}); do
    echo $(docker run -c ${CPU} -m ${MEMORY} -e ES_HEAP_SIZE=${MEMORY} -d -p 92${NUM}:9200 ${IMAGE_TAG})
  done
fi
