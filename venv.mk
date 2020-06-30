# Makefile to create and use a python virtual environment on the fly

# Use sphinx from virtualenv
SPHINXBUILD   ?= venv/bin/sphinx-build
SPHINXINTL    ?= venv/bin/sphinx-intl

# Create the venv and a timestamp file
venv/venv.timestamp:
	virtualenv -p python3 venv
	touch $@

# Install requirements and create a timestamp file
venv/REQUIREMENTS.timestamp: venv/venv.timestamp REQUIREMENTS.txt
	venv/bin/pip install -r REQUIREMENTS.txt
	touch $@

include Makefile

# Delete all including the venv
cleanall: springclean
	rm -rf venv

# Add dependencies to targets that require sphinx
html: venv/REQUIREMENTS.timestamp
latex: venv/REQUIREMENTS.timestamp
gettext: venv/REQUIREMENTS.timestamp
fasthtml: venv/REQUIREMENTS.timestamp
