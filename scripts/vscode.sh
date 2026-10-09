#!/usr/bin/env bash

# ----------------------------------------------
# User-adjustable parameters
# ----------------------------------------------

VSCODE_PROFILE="qgis-docs"
EXT_DIR=".vscode-extensions"
VSCODE_DIR=".vscode"
LOG_FILE="vscode.log"

REQUIRED_EXTENSIONS=(
    lextudio.restructuredtext@190.4.10
    shd101wyy.markdown-preview-enhanced@0.8.40
    naumovs.color-highlight@2.8.0
    waderyan.gitblame@11.1.3
    DavidAnson.vscode-markdownlint@0.60.0
    ms-python.vscode-pylance@2025.4.1
    leonhard-s.python-sphinx-highlight@0.3.0
    ms-python.debugpy@2025.8.0
    ms-python.python@2025.6.1
    ms-python.vscode-python-envs@1.38.0
    tht13.rst-vscode@3.0.1
    mkhl.direnv@0.17.0
    trond-snekvik.simple-rst@1.5.4
    yzhang.markdown-all-in-one@3.6.3
    aikebang.mkdocs-syntax-highlight@0.2.1
    lextudio.iis@1.0.15
    ms-python.vscode-python-envs@1.2.0
    searKing.preview-vscode@2.3.12
    foxundermoon.shell-format@7.2.5
    useblocks.sphinx-needs-vscode@0.3.2
    timonwong.shellcheck@0.37.7
    lextudio.restructuredtext-pack@1.0.3
)

# ----------------------------------------------
# Functions
# ----------------------------------------------

launch_vscode() {
    code --user-data-dir="$VSCODE_DIR" \
        --profile="${VSCODE_PROFILE}" \
        --extensions-dir="$EXT_DIR" "$@"
}

list_installed_extensions() {
    find "$EXT_DIR" -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
        pkg="$dir/package.json"
        if [[ -f "$pkg" ]]; then
            name=$(jq -r '.name' <"$pkg")
            publisher=$(jq -r '.publisher' <"$pkg")
            version=$(jq -r '.version' <"$pkg")
            echo "${publisher}.${name}@${version}"
        fi
    done
}

clean() {
    rm -rf .vscode .vscode-extensions
}
print_help() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

This script sets up and launches VSCode with a custom profile and extensions for the GeoSight Documentation project.

Actions performed:
    - Checks for required files and directories
    - Ensures VSCode and Docker are installed
    - Initializes VSCode user and extension directories if needed
    - Updates VSCode settings for commit signing, formatters, and linters (Markdown, Shell, Python)
    - Installs all required VSCode extensions
    - Launches VSCode with the specified profile and directories

Options:
    --help             Show this help message and exit
    --verbose          Print final settings.json contents before launching VSCode
    --list-extensions  List installed VSCode extensions in the custom extensions directory
    --clean            Remove the .vscode and .vscode-extensions directories completely

EOF
}

# Parameter handler
for arg in "$@"; do
    case "$arg" in
        --help)
            print_help
            exit 0
            ;;
        --verbose)
            # Handled later in the script
            ;;
        --list-extensions)
            echo "Installed extensions:"
            list_installed_extensions
            exit 0
            ;;
        --clean)
            echo "Remove .vscode and .vscode-extensions folders:"
            clean
            exit 0
            ;;
        *) ;;
    esac
done

# ----------------------------------------------
# Script starts here
# ----------------------------------------------

# Truncate the log file at the start
echo "🗨️ Truncating $LOG_FILE..."
true >"$LOG_FILE"

echo "🗨️ Checking VSCode is installed ..."
if ! command -v code &>/dev/null; then
    echo "  ❌ 'code' CLI not found. Please install VSCode and add 'code' to your PATH."
    exit 1
else
    echo "  ✅ VSCode found ok."
fi

# Ensure .vscode directory exists
echo "🗨️  Checking if VSCode has been run before..."
if [ ! -d .vscode ]; then
    echo "  🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻"
    echo "  ⭐️ It appears you have not run vscode in this project before."
    echo "     After it opens, please close vscode and then rerun this script"
    echo "     so that the extensions directory initialises properly."
    echo "  🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺"
    mkdir -p .vscode
    mkdir -p .vscode-extensions
    # Launch VSCode with the sandboxed environment
    launch_vscode .
    exit 1
else
    echo "  ✅ VSCode directory found from previous runs of vscode."
fi

#echo "🗨️ Checking mkdocs is installed ..."
#if ! command -v mkdocs &>/dev/null; then
#    echo "  ❌ 'mkdocs' CLI not found. Please install it and ensure you have permissions to use it."
#    exit 1
#else
#    echo "  ✅ mkdocs found ok."
#fi

echo "🗨️ Checking if VSCode has been run before..."
if [ ! -d "$VSCODE_DIR" ]; then
    echo "  ⭐️ First-time VSCode run detected. Opening VSCode to initialize..."
    mkdir -p "$VSCODE_DIR"
    mkdir -p "$EXT_DIR"
    launch_vscode .
    exit 1
else
    echo "  ✅ VSCode directory detected."
fi

SETTINGS_FILE="$VSCODE_DIR/settings.json"

echo "🗨️ Checking if settings.json exists..."
if [[ ! -f "$SETTINGS_FILE" ]]; then
    echo "{}" >"$SETTINGS_FILE"
    echo "  🔧 Created new settings.json"
else
    echo "  ✅ settings.json exists"
fi

echo "🗨️ Updating git commit signing setting..."
jq '.["git.enableCommitSigning"] = true' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
echo "  🔧 git.enableCommitSigning enabled"

echo "🗨️ Ensuring markdown formatter is set..."
if ! jq -e '."[markdown]".editor.defaultFormatter' "$SETTINGS_FILE" >/dev/null; then
    jq '."[markdown]" += {"editor.defaultFormatter": "DavidAnson.vscode-markdownlint"}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Markdown formatter set"
else
    echo "  ✅ Markdown formatter already configured"
fi

echo "🗨️ Ensuring shell script formatter and linter are set..."
if ! jq -e '."[shellscript]".editor.defaultFormatter' "$SETTINGS_FILE" >/dev/null; then
    jq '."[shellscript]" += {"editor.defaultFormatter": "foxundermoon.shell-format", "editor.formatOnSave": true}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Shell script formatter set to foxundermoon.shell-format, formatOnSave enabled"
else
    echo "  ✅ Shell script formatter already configured"
fi

if ! jq -e '.["shellcheck.enable"]' "$SETTINGS_FILE" >/dev/null; then
    jq '. + {"shellcheck.enable": true}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 ShellCheck linting enabled"
else
    echo "  ✅ ShellCheck linting already configured"
fi

if ! jq -e '.["shellformat.flag"]' "$SETTINGS_FILE" >/dev/null; then
    jq '. + {"shellformat.flag": "-i 4 -bn -ci"}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Shell format flags set (-i 4 -bn -ci)"
else
    echo "  ✅ Shell format flags already configured"
fi
echo "🗨️ Ensuring global format-on-save is enabled..."
if ! jq -e '.["editor.formatOnSave"]' "$SETTINGS_FILE" >/dev/null; then
    jq '. + {"editor.formatOnSave": true}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Global formatOnSave enabled"
else
    echo "  ✅ Global formatOnSave already configured"
fi

# Python formatter and linter
echo "🗨️ Ensuring Python formatter and linter are set..."
if ! jq -e '."[python]".editor.defaultFormatter' "$SETTINGS_FILE" >/dev/null; then
    jq '."[python]" += {"editor.defaultFormatter": "ms-python.black-formatter"}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Python formatter set to Black"
else
    echo "  ✅ Python formatter already configured"
fi

if ! jq -e '.["python.linting.enabled"]' "$SETTINGS_FILE" >/dev/null; then
    jq '. + {"python.linting.enabled": true, "python.linting.pylintEnabled": true}' "$SETTINGS_FILE" >"$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    echo "  🔧 Python linting enabled (pylint)"
else
    echo "  ✅ Python linting already configured"
fi

if [[ " $* " == *" --verbose "* ]]; then
    echo "🗨️ Final settings.json contents:"
    cat "$SETTINGS_FILE"
fi

# Add VSCode runner configuration

cat <<EOF >.vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Generate MkDocs HTML Config",
            "type": "shell",
            "command": "\${workspaceFolder}/create-mkdocs-html-config.sh",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": []
        }
    ]
}
EOF

echo "🗨️ Installing required extensions..."
for ext in "${REQUIRED_EXTENSIONS[@]}"; do
    if echo "$installed_exts" | grep -q "^${ext}$"; then
        echo "  ✅ Extension ${ext} already installed."
    else
        echo "  📦 Installing ${ext}..."
        # Capture both stdout and stderr to log file
        if launch_vscode --install-extension "${ext}" >>"$LOG_FILE" 2>&1; then
            # Refresh installed_exts after install
            installed_exts=$(list_installed_extensions)
            if echo "$installed_exts" | grep -q "^${ext}$"; then
                echo "  ✅ Successfully installed ${ext}."
            else
                echo "  ❌ Failed to install ${ext} (not found after install)."
                exit 1
            fi
        else
            echo "  ❌ Failed to install ${ext} (error during install). Check $LOG_FILE for details."
            exit 1
        fi
    fi
done

echo "🗨️ Launching VSCode..."
launch_vscode .
