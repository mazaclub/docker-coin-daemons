# version 1.4-1
FROM        mazaclub/coind-base
# IMAGE     mazaclub/mazacoind-base
MAINTAINER  guruvan "guruvan@maza.club"

#XPOSE      RPC   P2P   Testnet
CMD         ["/sbin/my_init"]
VOLUME      ["/home/coin"] 
EXPOSE      12832 12835

ENV BUILDER DOCKERHUB
ENV WORKDIR $(pwd)
ENV IMAGE mazalub/mazacoind-base
ENV APP mazacoind 
ENV COIN mazacoin
ENV COIN_SYM mzc
ENV STAGE PROD
ENV COMMIT 71d8144010bcfa8389efa2da0a277411e52ef488
RUN  set -x && apt-get update \
     && apt-get install -y libtool \
         wget bsdmainutils autoconf \
         apg libqrencode-dev libcurl4-openssl-dev \
         automake make ntp git build-essential \
         libssl-dev libboost-all-dev 
RUN echo "Building daemon" \
     && export COIN=mazacoin \
     && export APP=mazacoind \
     && if [ "${BUILDER}" = "LOCAL" ] ; then export MAKEJOBS="-j3" ; else export MAKEJOBS=""; fi \
     && git clone https://github.com/mazacoin/mazacoin-new ${COIN} \
     && cd ${COIN} \
     && git checkout 71d8144010bcfa8389efa2da0a277411e52ef488 \
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
     && rm -rf /mazacoin
 

COPY . /
RUN   chmod 700 /etc/service/mazacoind/run \
      && groupadd --gid 2211 coin \
      && adduser --disabled-password --gecos "mazacoin" --uid 2211 --gid 2211 coin \
      && chown -R coin.coin /home/coin \
      && chmod 600 /home/coin/.mazacoin/mazacoin.conf 
