#!/bin/bash


for image in coind-base freicoind-base dashpay-base groestlcoind-base mazacoind-base namecoind-base startcoind-base ; do
  cd ${image}
# change BUILDER
  sed -e 's/DOCKERHUB/LOCAL/g' Dockerfile > Dockerfile.local
  #set MAKEJOBS
  procs=$(grep processor /proc/cpuinfo | wc -l)
  procs=$((procs+1))
  sed -i -e 's/\-j3/\-j'${procs}'/g' Dockerfile.local
  # get docker image name from Dockerfile
  IMAGE="$(grep IMAGE Dockerfile | awk '{print $3}' )"
  # build it!
  docker build -f Dockerfile.local  -t ${IMAGE} .
  cd ..
done 


