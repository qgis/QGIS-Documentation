#!/bin/bash

set -e

for f in $(grep -rl '.. testcode::' docs/pyqgis_developer_cookbook/); do SINGLE_TEST=$(basename $f) make doctest; done
