#!/bin/bash

echo $SHKEEPER_BACKEND_KEY > /monero/SHKEEPER_BACKEND_KEY

exec /monero/monero-wallet-rpc "$@"
