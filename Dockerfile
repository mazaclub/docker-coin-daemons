# version 1.4-1
FROM        mazaclub/coind-base
# IMAGE     startcoin/startcoind-base
MAINTAINER  guruvan "guruvan@maza.club"

#XPOSE      RPC   P2P   Testnet
CMD         ["/sbin/my_init"]
VOLUME      ["/home/coin"] 
EXPOSE      9347 9247

ENV BUILDER DOCKERHUB
ENV GIT_TAG $(git rev-parse --short HEAD)
ENV WORKDIR $(pwd)
ENV IMAGE startcoin/startcoind-base
ENV APP startcoind 
ENV COIN startcoin
ENV COIN_SYM start
ENV STAGE PROD
RUN  apt-get update \
     && apt-get install -y libtool \
         wget bsdmainutils autoconf \
         apg libqrencode-dev libcurl4-openssl-dev \
         automake make ntp git build-essential \
         libssl-dev libboost-all-dev 
RUN echo "Building Daemon" \
     && export COIN=startcoin \
     && export APP=startcoind \
     && if [ "${BUILDER}" = "LOCAL" ] ; then export MAKEJOBS="-j3" ; else export MAKEJOBS="" ; fi \
     && git clone https://github.com/${COIN}-project/${COIN} ${COIN} \
     && cd ${COIN}/src \
     && export BDB_INCLUDE_PATH="${BDB_PREFIX}/include" \
     && export BDB_LIB_PATH="/db-4.8.30.NC/build_unix" \
     && sed -i 's/USE_UPNP\:\=0/USE_UPNP\:\=\-/g' makefile.unix \
     && make ${MAKEJOBS} -f makefile.unix \
     && mv ${APP} /usr/local/bin/ \
     && cd / \
     && rm -rf /src
 

COPY . /
RUN   chmod 700 /etc/service/startcoind/run \
      && groupadd --gid 2211 coin \
      && adduser --disabled-password --gecos "startcoin" --uid 2211 --gid 2211 coin \
      && chown -R coin.coin /home/coin \
      && chmod 600 /home/coin/.startcoin-v2/startcoin.conf 
