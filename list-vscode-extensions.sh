#!/usr/bin/env bash

code --extensions-dir=".vscode-extensions" --list-extensions | xargs -L 1 echo code --extensions-dir=".vscode-extensions" --install-extension
