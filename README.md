## groestlcoin/groestlcoind-base

Base image for running groestlcoind inside docker container

Basic instruction is contained in run-groestlcoind-docker.sh

 * FROM phusion/baseimage
   - provides full environment +  docker-ready init system  
 * FROM mazaclub/coind-base
   - provides all dependencies needed to build most coin daemons, including bdb4.8


Available as a Dockerhub Automated Trusted Build

   docker pull groestlcoin/groestlcoind-base

Dockerhub build 
 - starts with mazaclub/coind-base 
 - installs required deps via apt
 - pulls groestlcoin from official groestlcoin github source, 
 - compiles, installs & cleans src. 
 - adds supporting groestlcoin.conf and startup script to start groestlcoind

To use, simply run the included script, or provide a similar docker run statement

The container will start /sbin/my_init which will start groestlcoind

This image is suited for further use by blockexplorer or other server applications

Several runtime ENV variables are recognized
 - etc/service/groestlcoind/run 
 
