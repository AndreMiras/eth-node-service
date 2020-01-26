#!/usr/bin/env bash


CONFIG=$HOME/.config/prysm/env.sh
test -t 1 && USE_TTY="--tty"
test -f $CONFIG && source $CONFIG

docker pull gcr.io/prysmaticlabs/prysm/validator:latest
docker run \
    --interactive $USE_TTY --rm --volume $HOME/prysm:/data \
    --network="host" \
    --name validator-node \
    gcr.io/prysmaticlabs/prysm/validator:latest \
    --beacon-rpc-provider=127.0.0.1:4000 --keystore-path=/data --datadir=/data --password="$VALIDATOR_PRIVATE_KEY_PASSWORD"
