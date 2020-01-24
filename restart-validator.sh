#!/usr/bin/env bash


docker pull gcr.io/prysmaticlabs/prysm/validator:latest
docker run -it -v $HOME/prysm:/data --network="host" gcr.io/prysmaticlabs/prysm/validator:latest --beacon-rpc-provider=127.0.0.1:4000 --keystore-path=/data --datadir=/data --password='password'
