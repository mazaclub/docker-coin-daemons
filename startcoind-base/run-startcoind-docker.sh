docker run -d \
  --name start_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=9347 \
  -e P2PPORT=9247 \
  -v /opt/BIGDISK/START/home/coin:/home/coin \
  startcoin/startcoind-base
