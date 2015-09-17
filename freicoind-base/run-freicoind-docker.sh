docker run -d \
  --name grs_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=1441 \
  -e P2PPORT=1331 \
  -v /opt/BIGDISK/GRS/home/coin:/home/coin \
  groestlcoin/groestlcoind-base
