#!/usr/bin/env bash
echo "🪛 Running QGIS with the default profile:"
echo "--------------------------------"

# This is the flake approach, using Ivan Mincis nix spatial project and a flake
# see flake.nix for implementation details
GEEST_LOG=${GEEST_LOG} \
	RUNNING_ON_LOCAL=1 \
    nix run .#qgis-ltr -- qgis --profile QGIS
