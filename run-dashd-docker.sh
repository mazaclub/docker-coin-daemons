docker run -d \
  --name dash_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=9998 \
  -e P2PPORT=9999 \
  -v /opt/BIGDISK/DASH/home/coin:/home/coin \
  mazaclub/dashd-base
