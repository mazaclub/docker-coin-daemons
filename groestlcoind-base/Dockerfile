# version 1.4-1
FROM        mazaclub/coind-base
# IMAGE     mazaclub/groestlcoind-base
MAINTAINER  guruvan "guruvan@maza.club"

#XPOSE      RPC   P2P   Testnet
CMD         ["/sbin/my_init"]
VOLUME      ["/home/coin"] 
EXPOSE      1441 1331

ENV BUILDER DOCKERHUB
ENV WORKDIR $(pwd)
ENV IMAGE mazalub/groestlcoind-base
ENV APP groestlgoind 
ENV COIN groestlcoin
ENV COIN_SYM grs
ENV STAGE PROD
RUN  set -x && apt-get update \
     && apt-get install -y libtool \
         wget bsdmainutils autoconf \
         apg libqrencode-dev libcurl4-openssl-dev \
         automake make ntp git build-essential \
         libssl-dev libboost-all-dev 
RUN echo "Building daemon" \
     && export COIN=groestlcoin \
     && export APP=groestlcoind \
     && if [ "${BUILDER}" = "LOCAL" ] ; then export MAKEJOBS="-j3" ; else export MAKEJOBS="" ; fi\
     && git clone https://github.com/groestlcoin/groestlcoin ${COIN} \
     && cd ${COIN} \
     && export BDB_INCLUDE_PATH="${BDB_PREFIX}/include" \
     && export BDB_LIB_PATH="/db-4.8.30.NC/build_unix" \
     && ./autogen.sh \
     && LDFLAGS="-L${BDB_PREFIX}/lib" CPPFLAGS="-I${BDB_PREFIX}/include/ ${CPPFLAGS}" ./configure --enable-cxx --disable-shared --with-pic \
     && cd src  \
     && sed -i 's/USE_UPNP\:\=0/USE_UPNP\:\=\-/g' Makefile \
     && make \
     && make install \
     && mv ${APP} /usr/local/bin/ \
     && cd / \
     && rm -rf /groestlcoin
 

COPY . /
RUN   chmod 700 /etc/service/groestlcoind/run \
      && groupadd --gid 2211 coin \
      && adduser --disabled-password --gecos "groestlcoin" --uid 2211 --gid 2211 coin \
      && chown -R coin.coin /home/coin \
      && chmod 600 /home/coin/.groestlcoin/groestlcoin.conf 
