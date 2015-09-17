docker run -d \
  --name nmc_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=8336 \
  -e P2PPORT=8334 \
  -v /opt/BIGDISK/NMC/home/coin:/home/coin \
  mazaclub/namecoind-base
