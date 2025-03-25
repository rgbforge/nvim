#!/bin/bash

echo "Enter path where Neovim is installed:"
read NEOVIM_PATH

if [ -z "$NEOVIM_PATH" ]; then
  echo "Error: No path provided"
  exit 1
fi

if [ ! -d "$NEOVIM_PATH" ]; then
  echo "Error: Directory $NEOVIM_PATH does not exist"
  exit 1
fi

SHELL_CONFIG="$HOME/.bashrc"  
echo "Adding neovim to $SHELL_CONFIG"


{
  echo "export PATH=\"$NEOVIM_PATH/bin:\$PATH\""
  echo "export XDG_DATA_DIRS=\"$NEOVIM_PATH/share:\$XDG_DATA_DIRS\""
  echo "export LD_LIBRARY_PATH=\"$NEOVIM_PATH/lib64:\$LD_LIBRARY_PATH\""
} >> "$SHELL_CONFIG"


echo "Neovim env variables added to $SHELL_CONFIG. Running 'source $SHELL_CONFIG'"

echo "alias enw='emacs -nw'" >> ~/.bashrc
echo "alias n='nvim'" >> ~/.bashrc
source ~/.bashrc

