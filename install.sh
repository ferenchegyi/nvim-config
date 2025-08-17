#!/bin/bash

echo "Installation script starts..."

check_error() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

install_packages() {
  rm -rf "$HOME/.local/share/nvim"

  echo "Installing NPM Packages"

  cd dependencies || {
    echo "Error: Failed to change directory to 'dependencies'"
    exit 1
  }

  if [ -d "node_modules" ]; then
    echo "NPM: Removing old node_modules..."
    rm -rf "node_modules"
    check_error "Failed to remove old node_modules"
  fi

  echo "NPM: Running npm ci..."
  npm ci
  check_error "npm ci failed"

  echo "NPM: Adding LSP binaries to the PATH"
  PATH_TO_ADD='export PATH="$PATH:$HOME/.config/nvim/dependencies/node_modules/.bin"'

  if ! grep -q "$PATH_TO_ADD" ~/.bashrc; then
    echo "$PATH_TO_ADD" >> ~/.bashrc
    echo "NPM: Path added to .bashrc"
  else
    echo "NPM: Path already exists in .bashrc"
  fi

  source ~/.bashrc
  echo "NPM: .bashrc reloaded"

  echo "Installation completed successfully."
}

echo "The installation will remove your existing NVIM config!"
echo "Continue if you already have a backup"
read -p "Do you want to continue with the installation? (y/N): " answer
answer=${answer:-N}  # Default to 'N' if no input is given

if [[ "$answer" =~ ^[Yy]$ ]]; then
  install_packages
else
  echo "Installation aborted."
  exit 1
fi
