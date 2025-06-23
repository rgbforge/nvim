# rgbforge's basic neovim setup

A neovim setup focused on only the basics, doesn't include language server support or other advanced features. If you want a more fully-featured setup, checkout the [main branch](https://github.com/rgbforge/nvim/).


## Core Plugin

* `nvim-treesitter`

For basic syntax highlights

## Prerequisites

#### Necessary General System Packages

* `gcc`
* `make`
* `cmake`
* `git`

#### Clipboard for WSL
One of the following clipboard tools must be installed for system clipboard integration.

* `xclip` or `wayclip` 


## Installation

### Note: This script modifies .bashrc. If you use another shell (e.g., zsh), you must manually add these lines to your ~/.zshrc or fish file.

```
cd ~/.config
git clone https://github.com/rgbforge/nvim
cd ~/nvim

EITHER

mkdir INSTALL && cd INSTALL
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_INSTALL_PREFIX=$(pwd) install

OR

cd scripts
bash install.sh



```





install.sh in the scripts dir adds NVIM_INSTALL_PATH to PATH, XDG_DATA_DIRS, LD_LIBRARY_PATH
and alias n='nvim'" to .bashrc

source ~/.bashrc or open a new terminal


