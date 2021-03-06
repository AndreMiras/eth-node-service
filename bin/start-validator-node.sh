#!/usr/bin/env bash


CONFIG=$HOME/.config/prysm/env.sh
test -t 1 && USE_TTY="--tty"
test -f $CONFIG && source $CONFIG

docker pull gcr.io/prysmaticlabs/prysm/validator:latest
docker run \
    --interactive $USE_TTY --rm --volume $HOME/.eth2validators:/data \
    --network="host" \
    --name validator-node \
    gcr.io/prysmaticlabs/prysm/validator:latest \
    --keystore-path=/data \
    --keymanager=keystore --keymanageropts='{"path": "/data", "passphrase": "'"$VALIDATOR_PRIVATE_KEY_PASSWORD"'"}'
