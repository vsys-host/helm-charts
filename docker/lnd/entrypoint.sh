#!/bin/bash

set -e

NETWORK=${NETWORK:-mainnet}
WALLET_DIR=$HOME/.lnd/data/chain/bitcoin/$NETWORK
WALLET_PASSWORD_FILE=${WALLET_PASSWORD_FILE:-$HOME/.lnd/wallet-password}
WALLET_SEED_FILE=${WALLET_SEED_FILE:-$HOME/.lnd/wallet-seed}

if [ ! -f $WALLET_DIR/wallet.db ]; then
    echo "[$0 - STARTUP] Wallet not found, creating a new one..."

    mkdir -p $WALLET_DIR
    echo -n shkeeper > $WALLET_PASSWORD_FILE

    echo "[$0 - STARTUP] Generating seed"
    lndinit gen-seed > $WALLET_SEED_FILE

    echo "[$0 - STARTUP] Creting wallet"
    lndinit -v init-wallet \
        --secret-source=file \
        --file.seed=$WALLET_SEED_FILE \
        --file.wallet-password=$WALLET_PASSWORD_FILE \
        --init-file.output-wallet-dir=$HOME/.lnd/data/chain/bitcoin/$NETWORK
else
    echo "[$0 - STARTUP] Wallet found, skipping new wallet creation..."
fi


# And finally start lnd. We need to use "exec" here to make sure all signals are
# forwarded correctly.
echo "[$0 - STARTUP] Starting lnd with flags: $@"
exec lnd "$@"