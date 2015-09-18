# docker-coin-daemons

Base images for typical bitcoin-derived coin daemons, provides BDB 4.8 compiled from official, or mazaclub source

Each coin is placed in its own branch, as is the base image

Examples are available for series 0.8 and 0.9+ coinds 

Each Branch supports an automated build 
 Base = maazaclub/coind-base
 MZC  = mazaclub/mazacoind-base
 NMC  = mazaclub/namecoind-base
 DASH = mazaclub/dashpay-base
 etc

mazaclub/XXXcoind-base Images are 
 FROM phusion/baseimage
 FROM mazaclub/coind-base

Simple example shell script to run coind images is included in each coind branch
Unit files suitable for deployment on coreos are also included. 
 - images are used in mazaclub's production network via coreos with nearly identical unit files. 

Intended to provide a known base for coin daemon us in applications, such as blockexplorers, 
electrum/encompass-mercury servers, API services, and more.  

Pull requests are welcomed. Please submit PRs to Develop branch. 

For further use, see https://github.com/mazaclub/docker-encompass-mercury
            
