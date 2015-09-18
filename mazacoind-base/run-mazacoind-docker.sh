docker run -d \
  --name mazacoin_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=12835 \
  -e P2PPORT=12832 \
  -v /opt/BIGDISK/MZC/home/coin:/home/coin \
  mazaclub/mazacoind-base
