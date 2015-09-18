#!/bin/bash

# change BUILDER

sed -e 's/DOCKERHUB/LOCAL/g' Dockerfile > Dockerfile.local

#set MAKEJOBS
# protable enough for now
procs=$(grep processor /proc/cpuinfo | wc -l)
procs=$((procs+1))
sed -i -e 's/\-j3/\-j'${procs}'/g' Dockerfile.local

IMAGE="$(grep IMAGE Dockerfile | awk '{print $3}' )"

docker build -f Dockerfile.local  -t ${IMAGE} .
