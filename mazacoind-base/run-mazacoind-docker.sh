docker run -d \
  --name mazacoin_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=8336 \
  -e P2PPORT=8334 \
  -v /opt/BIGDISK/NMC/home/coin:/home/coin \
  mazaclub/mazacoind-base
