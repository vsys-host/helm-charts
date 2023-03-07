#!/bin/bash

TXID="$1"
CRYPTO="XMR"

curl -X POST -H "X-Shkeeper-Backend-Key: $(cat /monero/SHKEEPER_BACKEND_KEY)" "http://shkeeper:5000/api/v1/walletnotify/${CRYPTO}/${TXID}"
