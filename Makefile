SERVICES_PATHS=systemd/*.service
SERVICES=`for service in $(SERVICES_PATHS); do basename $$service; done`

install:
	systemctl --user link $(SERVICES_PATHS)

uninstall:
	systemctl --user disable $(SERVICES)
