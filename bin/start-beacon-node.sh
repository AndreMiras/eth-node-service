#!/usr/bin/env bash


test -t 1 && USE_TTY="--tty"
docker pull gcr.io/prysmaticlabs/prysm/beacon-chain:latest
docker run \
    --interactive $USE_TTY --rm --volume $HOME/prysm:/data \
    --publish 4000:4000 --publish 13000:13000 \
    --name beacon-node \
    gcr.io/prysmaticlabs/prysm/beacon-chain:latest \
    --datadir=/data --p2p-host-ip=$(curl -s v4.ident.me)
