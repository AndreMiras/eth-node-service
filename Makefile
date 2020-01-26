SERVICES_PATHS=systemd/*.service
SERVICES=`for service in $(SERVICES_PATHS); do basename $$service; done`
BINARIES_PATHS=bin/*.sh
BINARIES=`for binaries in $(BINARIES_PATHS); do basename $$binaries; done`
BIN_INSTALL_PATH=$(HOME)/.bin
CONFIG_PATH=config/prysm/env.sh
CONFIG_INSTALL_PATH=$(HOME)/.config/prysm


install/systemd_units:
	systemctl --user link $(SERVICES_PATHS)

install/binaries:
	mkdir -p $(BIN_INSTALL_PATH)
	cp $(BINARIES_PATHS) $(BIN_INSTALL_PATH)

$(CONFIG_INSTALL_PATH):
	mkdir -p $@
	cp -r $(CONFIG_PATH) $@

install/config: $(CONFIG_INSTALL_PATH)

install: install/systemd_units install/binaries install/config

uninstall/systemd_units:
	systemctl --user disable $(SERVICES)

uninstall/binaries:
	cd $(BIN_INSTALL_PATH) && rm $(BINARIES)

uninstall: uninstall/systemd_units uninstall/binaries
