#!/bin/bash

IMAGE_TAG=elasticsearch:latest
#MUST BE IN BYTES...
MEMORY=1073741824
#DEFAULT SHARE
CPU=1024

if (( $# == 0 )); then
  echo $(docker run -c ${CPU} -m ${MEMORY} -e ES_HEAP_SIZE=${MEMORY} -d -p 9200:9200 ${IMAGE_TAG})
else
  COUNT=$(expr ${1} - 1)
  for NUM in $(seq -w 00 ${COUNT}); do
    echo $(docker run -c ${CPU} -m ${MEMORY} -e ES_HEAP_SIZE=${MEMORY} -d -p 92${NUM}:9200 ${IMAGE_TAG})
  done
fi
