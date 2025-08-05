# Makefile to run targets in docker containers

doctest:
	docker build -t qgis/documentation:latest -f doctest.dockerfile .
	docker run --rm \
		--env=QGIS_PREFIX_PATH=/usr \
		--env=PYTHONPATH=/usr/share/qgis/python \
		--env=QGIS_DISABLE_MESSAGE_HOOKS=1 \
		--env=QGIS_NO_OVERRIDE_IMPORT=1 \
		--user=$(shell id -u) \
		--volume=$(PWD):/documentation \
		qgis/documentation:latest
