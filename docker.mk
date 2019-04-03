# Makefile to run targets in docker containers

doctest:
	docker build -t qgis/documentation:release-3_4 -f doctest.dockerfile .
	docker run --rm \
		--env=QGIS_PREFIX_PATH=/usr \
		--user=$(shell id -u) \
		--volume=$(PWD):/documentation \
		qgis/documentation:release-3_4
