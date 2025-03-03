#!/usr/bin/env bash
echo "🪛 Installing VSCode Extensions:"
echo "--------------------------------"

# Locate QGIS binary
QGIS_BIN=$(which qgis)

if [[ -z "$QGIS_BIN" ]]; then
    echo "Error: QGIS binary not found!"
    exit 1
fi

# Extract the Nix store path (removing /bin/qgis)
QGIS_PREFIX=$(dirname "$(dirname "$QGIS_BIN")")

# Construct the correct QGIS Python path
QGIS_PYTHON_PATH="$QGIS_PREFIX/share/qgis/python"
# Needed for qgis processing module import
PROCESSING_PATH="$QGIS_PREFIX/share/qgis/python/qgis"

# Check if the Python directory exists
if [[ ! -d "$QGIS_PYTHON_PATH" ]]; then
    echo "Error: QGIS Python path not found at $QGIS_PYTHON_PATH"
    exit 1
fi

# Create .env file for VSCode
ENV_FILE=".env"

QTPOSITIONING="/nix/store/nb3gkbi161fna9fxh9g3bdgzxzpq34gf-python3.11-pyqt5-5.15.10/lib/python3.11/site-packages"

echo "Creating VSCode .env file..."
cat <<EOF > "$ENV_FILE"
PYTHONPATH=$QGIS_PYTHON_PATH:$QTPOSITIONING
QGIS_PREFIX_PATH=$QGIS_PREFIX
PYQT5_PATH="$QGIS_PREFIX/share/qgis/python/PyQt"
QT_QPA_PLATFORM=offscreen
EOF

echo "✅ .env file created successfully!"
echo "Contents of .env:"
cat "$ENV_FILE"

# Also set the python path in this shell in case we want to run tests etc from the command line
export PYTHONPATH=$PYTHONPATH:$QGIS_PYTHON_PATH

# Ensure .vscode directory exists
mkdir -p .vscode

# Define the settings.json file path
SETTINGS_FILE=".vscode/settings.json"

# Ensure settings.json exists
if [[ ! -f "$SETTINGS_FILE" ]]; then
    echo "{}" > "$SETTINGS_FILE"
fi

# Update settings.json non-destructively
echo "Updating VSCode settings.json..."
jq --arg pyenv "\${workspaceFolder}/.env" \
   --arg qgispath "$QGIS_PYTHON_PATH" \
   --arg prefixpath "$QGIS_PREFIX" \
   '.["python.envFile"] = $pyenv |
    .["python.analysis.extraPaths"] += [$qgispath] |
    .["terminal.integrated.env.linux"].PYTHONPATH = $qgispath |
    .["git.enableCommitSigning"] = true' \
   "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"

echo "✅ VSCode settings.json updated successfully!"
echo "Contents of settings.json:"
cat "$SETTINGS_FILE"

# Install required extensions
code --user-data-dir='.vscode' \
--profile='qgis-documentation' \
--extensions-dir='.vscode-extensions' . \
--install-extension github.copilot@1.272.0 \
--install-extension github.copilot-chat@0.24.1 \
--install-extension github.vscode-pull-request-github@0.104.1 

# Launch VSCode with the sandboxed environment
code --user-data-dir='.vscode' \
--profile='qgis-documentation' \
--extensions-dir='.vscode-extensions' .
