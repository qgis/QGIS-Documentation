# Makefile to create and use a python virtual environment on the fly

# QGIS_PREFIX_PATH, used to determine relative paths.
# Default to system QGIS installation
QGIS_PREFIX_PATH ?= /usr

# Include system packages (needed for PyQt)
PYTHONPATH ?= /usr/lib/python3/dist-packages

# Include QGIS binaries and Python binding
ifneq ($(QGIS_PREFIX_PATH), "")
LD_LIBRARY_PATH := $(QGIS_PREFIX_PATH)/lib:$(LD_LIBRARY_PATH)
# For install folder
PYTHONPATH := $(QGIS_PREFIX_PATH)/share/qgis/python:$(PYTHONPATH)
PYTHONPATH := $(QGIS_PREFIX_PATH)/share/qgis/python/plugins:$(PYTHONPATH)
# For build output folder
PYTHONPATH := $(QGIS_PREFIX_PATH)/python:$(PYTHONPATH)
endif

# Use sphinx from virtualenv
SPHINXBUILD   ?= QGIS_PREFIX_PATH=$(QGIS_PREFIX_PATH) LD_LIBRARY_PATH=$(LD_LIBRARY_PATH) PYTHONPATH=$(PYTHONPATH) venv/bin/sphinx-build
SPHINXINTL    ?= venv/bin/sphinx-intl

# Delete all including the virtual environment
cleanall: springclean
	rm -rf venv

# Create the venv and a timestamp file
venv/venv.timestamp:
	python3 -m venv venv
	touch $@

# Install requirements and create a timestamp file
venv/REQUIREMENTS.timestamp: venv/venv.timestamp REQUIREMENTS.txt
	venv/bin/pip install -r REQUIREMENTS.txt
	touch $@

include Makefile

# Add dependencies to targets that require sphinx
html: venv/REQUIREMENTS.timestamp
gettext: venv/REQUIREMENTS.timestamp
fasthtml: venv/REQUIREMENTS.timestamp
doctest: venv/REQUIREMENTS.timestamp
