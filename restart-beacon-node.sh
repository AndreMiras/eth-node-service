#!/usr/bin/env bash


docker pull gcr.io/prysmaticlabs/prysm/beacon-chain:latest
docker rm beacon-node
docker run -it -v $HOME/prysm:/data -p 4000:4000 -p 13000:13000 --name beacon-node gcr.io/prysmaticlabs/prysm/beacon-chain:latest --datadir=/data --p2p-host-ip=$(curl -s v4.ident.me)
