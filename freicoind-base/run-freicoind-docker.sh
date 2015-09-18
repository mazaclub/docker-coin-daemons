docker run -d \
  --name frc_daemon \
  -e TXINDEX=1 \
  -e RPCPORT=1441 \
  -e P2PPORT=1331 \
  -v /opt/BIGDISK/FRC/home/coin:/home/coin \
  mazaclub/freicoind-base
