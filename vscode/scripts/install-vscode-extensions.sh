#!/bin/bash
while read extension; do
  echo "Installing: $extension"
  code --install-extension $extension
done < vscode-extensions.txt

