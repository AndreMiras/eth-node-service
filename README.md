# Ethereum Node Service

Bunch of scripts to run Ethereum nodes as background service.
Features:
- Ethereum 1.0 support (TODO)
- Ethereum 2.0 support
- Seamlessly node restart on crash
- Multi client support
  - [Prysm](https://github.com/prysmaticlabs/prysm)
    - Beacon node
    - Validation node
  - [Lighthouse](https://github.com/sigp/lighthouse) (TODO)
  - [Trinity](https://github.com/ethereum/trinity) (TODO)
- Multiple init daemon support
  - SysVinit (TODO)
  - Systemd (TODO)


## Install
Install/uninstall after cloning and using the [Makefile](Makefile).
```sh
git clone https://github.com/AndreMiras/eth-node-service.git
make install
```

## Usage
Node status and log is then accessed like any services.
```sh
systemctl --user status beacon-node
journalctl -u beacon-node
```
In the same way you can start/stop the services.
```sh
systemctl --user start beacon-node
systemctl --user start validator-node
```
