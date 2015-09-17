docker run -d \
  --name nmc_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=9998 \
  -e P2PPORT=9999 \
  -v /opt/BIGDISK/NMC/home/coin:/home/coin \
  mazaclub/dashd-base
