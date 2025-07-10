#!/bin/bash

set -e
set -u
set -o pipefail

INSTALL_DIR="$HOME/.config/nvim/INSTALL"
SHELL_CONFIG_FILE="$HOME/.bashrc"

NODE_VERSION="22.4.0"
NODE_ARCH="x64"
NODE_TARBALL="node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.xz"
NODE_URL="https://nodejs.org/dist/v${NODE_VERSION}/${NODE_TARBALL}"
NODE_EXTRACTED_DIR="node-v${NODE_VERSION}-linux-${NODE_ARCH}"

usage() {
  echo "neovim installer from source into '$INSTALL_DIR'."
  echo "this can include node.js for full python LSP support and xclip."
  echo ""
  echo "Usage: $0 -b [basic|full]"
  echo ""
  echo "Options:"
  echo "  -b basic      neovim and xclip"
  echo "  -b full       neovim, node.js, and xclip"
  echo "  -h            help message"
  echo ""
  echo "Example: $0 -b full"
}

install_neovim() {
  if [ ! -d "$INSTALL_DIR/neovim" ]; then
    echo "cloning neovim repo..."
    git clone https://github.com/neovim/neovim "$INSTALL_DIR/neovim"
  else
    echo "repo already exists, skipping"
  fi

  cd "$INSTALL_DIR/neovim"

  echo "building neovim of type: RelWithDebInfo"
  make CMAKE_BUILD_TYPE=RelWithDebInfo

  echo "Installing Neovim to $INSTALL_DIR..."
  make CMAKE_INSTALL_PREFIX="$INSTALL_DIR" install

  echo "neovim install complete"
}

install_node() {
  cd "$INSTALL_DIR"

  echo "wget-ing node.js version ${NODE_VERSION}..."
  wget -q --show-progress "$NODE_URL"

  echo "extracting"
  tar -xf "$NODE_TARBALL"

  echo "moving node.js files to $INSTALL_DIR..."
  cp -rT "$NODE_EXTRACTED_DIR/" "$INSTALL_DIR/"

  echo "cleaning up node.js download"
  rm -rf "$NODE_TARBALL" "$NODE_EXTRACTED_DIR"

  echo "node.js install complete"
}

install_xclip() {
  cd "$INSTALL_DIR"

  if [ ! -d "$INSTALL_DIR/xclip" ]; then
    echo "cloning xclip repo..."
    git clone https://github.com/astrand/xclip.git
  else
    echo "xclip repo already exists, skipping clone"
  fi

  cd "xclip/"

  echo "configuring xclip..."
  autoreconf -i
  ./configure --prefix="$INSTALL_DIR"

  echo "building xclip..."
  make

  echo "installing xclip..."
  make install

  echo "xclip install complete"
}

update_shell_config() {
  echo "!!! MAKING CHANGES TO BASHRC - DOUBLE CHECK SHELL CONFIG !!!"

  touch "$SHELL_CONFIG_FILE"

  declare -A config_lines
  config_lines=(
    ["PATH"]='export PATH="'"$INSTALL_DIR/bin"':$PATH"'
    ["XDG_DATA_DIRS"]='export XDG_DATA_DIRS="'"$INSTALL_DIR/share"':$XDG_DATA_DIRS"'
    ["LD_LIBRARY_PATH"]='export LD_LIBRARY_PATH="'"$INSTALL_DIR/lib"':'"$INSTALL_DIR/lib64"':$LD_LIBRARY_PATH"'
    ["alias"]='alias n="nvim"'
  )

  for key in "${!config_lines[@]}"; do
    line="${config_lines[$key]}"
    if ! grep -qF "$line" "$SHELL_CONFIG_FILE"; then
      echo "Adding $key to $SHELL_CONFIG_FILE"
      echo -e "\n# Added by neovim installer\n$line" >> "$SHELL_CONFIG_FILE"
    else
      echo "$key config already exists in $SHELL_CONFIG_FILE, skipping"
    fi
  done

  echo "shell config complete"
  echo ""
  echo "IMPORTANT: Run 'source $SHELL_CONFIG_FILE' or restart terminal"
}

BUILD_TYPE=""

if [ "$#" -eq 0 ]; then
  usage
  exit 0
fi

while getopts ":b:h" opt; do
  case ${opt} in
    b )
      BUILD_TYPE=$OPTARG
      ;;
    h )
      usage
      exit 0
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      usage
      exit 1
      ;;
    : )
      echo "Invalid option: -$OPTARG requires an argument basic or full" 1>&2
      usage
      exit 1
      ;;
  esac
done

mkdir -p "$INSTALL_DIR"

case $BUILD_TYPE in
  basic)
    echo "BASIC installation"
    install_neovim
    install_xclip
    update_shell_config
    ;;
  full)
    echo "FULL installation"
    install_neovim
    install_node
    install_xclip
    update_shell_config
    ;;
  *)
    echo "Error: Invalid build option '$BUILD_TYPE', should be basic or full"
    usage
    exit 1
    ;;
esac

echo ""
echo "install finished"
