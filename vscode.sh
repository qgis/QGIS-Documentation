#!/usr/bin/env bash
echo "🪛 Installing VSCode Extensions:"
echo "--------------------------------"
code --extensions-dir=".vscode-extensions" --install-extension github.copilot
code --extensions-dir=".vscode-extensions" --install-extension github.copilot-chat
code --extensions-dir=".vscode-extensions" --install-extension github.vscode-pull-request-github
code --extensions-dir=".vscode-extensions" .
