#!/usr/bin/env bash

CARDANO_NODE_PORT=3001
NETWORK=testnet
POOL_NAME=africa
KES_VERSION=000

cd ~/cardano-staking-pool-edu && git pull --rebase # Ensure we're on the latest version of the project

## DO NOT CHANGE BELOW HERE

NODE_MODE=bp

KES_SKEY_PATH="/home/cardano/keys/${POOL_NAME}.kes-${KES_VERSION}.skey"
VRF_SKEY_PATH="/home/cardano/keys/${POOL_NAME}.vrf.skey"
NODE_OP_CERT_PATH="/home/cardano/keys/${POOL_NAME}.node-${KES_VERSION}.opcert"

docker stop cardano-node-testnet
docker rm cardano-node-testnet
cd ~/cardano-staking-pool-edu/cardano-node && \
  ./run-node.sh /home/ubuntu/cardano-node/testnet "${CARDANO_NODE_PORT}" --restart unless-stopped \
  -v /home/ubuntu/.keys/testnet:/home/cardano/keys
