# Ethereum Node Service

Bunch of scripts to run Ethereum nodes as background service.
Features:
- Ethereum 1.0 support (TODO)
- Ethereum 2.0 support
- Seamlessly node restart on crash
- Non-root install
- Multi client support
  - [Prysm](https://github.com/prysmaticlabs/prysm)
    - Beacon node
    - Validation node
  - [Lighthouse](https://github.com/sigp/lighthouse) (TODO)
  - [Trinity](https://github.com/ethereum/trinity) (TODO)
- Multiple init daemon support
  - SysVinit (TODO)
  - Systemd


## Install
Install/uninstall after cloning and using the [Makefile](Makefile).
```sh
git clone https://github.com/AndreMiras/eth-node-service.git
cd eth-node-service
make install
```

## Config & Usage
Configure at least the validator password by editing the `~/.config/prysm/env.sh` file.
See an example of this file in [config/prysm/env.sh](config/prysm/env.sh).
Then start the services using e.g. `systemctl`.
```sh
systemctl --user start beacon-node
systemctl --user start validator-node
```
Node status and log is then accessed like any services.
```sh
systemctl --user status beacon-node
journalctl --user --follow --unit beacon-node
```
