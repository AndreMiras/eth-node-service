#!/usr/bin/env bash


docker pull gcr.io/prysmaticlabs/prysm/beacon-chain:latest
docker run \
    --interactive --rm --volume $HOME/prysm:/data \
    --publish 4000:4000 --publish 13000:13000 \
    --name beacon-node \
    gcr.io/prysmaticlabs/prysm/beacon-chain:latest \
    --datadir=/data --p2p-host-ip=$(curl -s v4.ident.me)