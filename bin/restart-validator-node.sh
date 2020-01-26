#!/usr/bin/env bash


docker pull gcr.io/prysmaticlabs/prysm/validator:latest
docker run \
    --interactive --rm --volume $HOME/prysm:/data \
    --network="host" \
    --name validator-node \
    gcr.io/prysmaticlabs/prysm/validator:latest \
    --beacon-rpc-provider=127.0.0.1:4000 --keystore-path=/data --datadir=/data --password='password'
