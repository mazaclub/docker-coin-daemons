# version 1.4-1
FROM        mazaclub/coind-base
# IMAGE     groestlcoin/groestlcoind-base
MAINTAINER  guruvan "guruvan@maza.club"

#XPOSE      RPC   P2P   Testnet
CMD         ["/sbin/my_init"]
VOLUME      ["/home/coin"] 
EXPOSE      1441 1331

ENV GIT_TAG $(git rev-parse --short HEAD)
ENV WORKDIR $(pwd)
ENV IMAGE groestlcoin/groestlcoind-base
ENV APP GroestlCoind 
ENV COIN GroestlCoin
ENV STAGE PROD
ENV MAKEJOBS 4
RUN  apt-get update \
     && apt-get install -y libtool \
         wget bsdmainutils autoconf \
         apg libqrencode-dev libcurl4-openssl-dev \
         automake make ntp git build-essential \
         libssl-dev libboost-all-dev \
     && export COIN=GroestlCoin \
     && export APP=GroestlCoind \
     && git clone https://github.com/${COIN}/${COIN} ${COIN} \
     && cd ${COIN}/src \
     && export BDB_INCLUDE_PATH="${BDB_PREFIX}/include" \
     && export BDB_LIB_PATH="/db-4.8.30.NC/build_unix" \
     && sed -i 's/USE_UPNP\:\=0/USE_UPNP\:\=\-/g' makefile.unix \
     && make -j ${MAKEJOBS} -f makefile.unix \
     && mv ${APP} /usr/local/bin/ \
     && cd / \
     && rm -rf /src
 

COPY . /
RUN   chmod 700 /etc/service/groestlcoind/run \
      && groupadd --gid 2211 coin \
      && adduser --disabled-password --gecos "groestlcoin" --uid 2211 --gid 2211 coin \
      && chown -R coin.coin /home/coin \
      && chmod 600 /home/coin/.GroestlCoin/GroestlCoin.conf 
