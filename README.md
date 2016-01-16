# docker-coinds

Base image for typical bitcoin-derived coin daemons, provides BDB 4.8 compiled from source

Each coin is placed in its own branch, as is the base image

Examples are available for series 0.8 and 0.9+ coinds 


Each Branch supports an automated build 
 Base = maazaclub/coind-base
 MZC  = mazaclub/mazacoind-base
 NMC  = mazaclub/namecoind-base
 DASH = mazaclub/dashpay-base
 etc

## Bitcoin Versions:
Because of network developments in bitcoin, several versions will be offered
For each branch, multiple tags may be available. 
Latest tag will always be master branch from official sources
Additional tags may be provided for release versions and / or specific patches

 -  btc-core        = mazaclub/bitcoind-base
 -  btc-classic     = mazaclub/btc-classic-base
 -  btc-unlimited   = mazaclub/btc-unlimites-base
 -  btc-therealbtc  = mazaclub/threalbitcoin-base




mazaclub/XXXcoind-base Images are 
 FROM phusion/baseimage
 FROM mazaclub/coind-base

Simple example shell script to run coind images is included in each coind branch

Intended to provide a known base for coin daemon us in applications, such as blockexplorers, 
electrum/encompass-mercury servers, API services, and more.  

 - phusion/baseimage provides "dockerized" init system /sbin/my_init (similar to s6)
 - daemons stay in foreground (stderr stdout sent to docker logs)
 - /etc/service/{COIN}d/run controls the daemon - mv to /tmp & back to start/stop

 - /home/coin/.{COIN}/ has your standard coin directory (debug.log, blockchain data etc) 
 - /usr/local/bin/{COIN}d  (and -cli -txn if later series coin code) 

Images are somewhat large to support compiling from official sources and to support phusion init. Gentoo bases would be much more efficient. 


Pull requests are welcomed. Please submit PRs to Develop branch. 

For further use, see https://github.com/mazaclub/docker-encompass-mercury
            
