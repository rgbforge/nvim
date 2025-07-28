# rgbforge's neovim setup

If you are new to neovim, the [basic branch](https://github.com/rgbforge/nvim/tree/basic) would be worth considering, as the main branch is a "fully-featured" setup for neovim including language servers and advanced configurations.


## Core Plugins

* `nvim-lspconfig`
* `nvim-treesitter`
* `neogit`
* `mason.nvim`
* `telescope.nvim`
* `nvim-cmp`

## Configured Languages

* C++
* Python
* Lua

---

## Prerequisites

#### Necessary General System Packages

* `gcc`
* `make`
* `cmake`
* `git`

#### Necessary System Packages for LSP
The following packages are required by the specific LSP servers managed by this configuration.

* `unzip`
* `c++` (for `clangd`)
* `npm` (for `pyright`)

#### Clipboard for WSL
One of the following clipboard tools must be installed for system clipboard integration.

* `xclip` or `wayclip` 



#### Notes on Distro-Specific Package Requirements

**Debian 12:** `ruff` requires rebuild from source due to glibc versioning. The following packages are required:

```
sudo apt install build-essential cargo pkg-config libssl-dev
```
**Debian 12:** `xclip` requires autotools and libxmu-dev. The following packages are required:
```
sudo apt install autoconf automake libtool libxmu-dev
```

---

## Installation

### Note: This script modifies .bashrc. If you use another shell (e.g., zsh), you must manually add these lines to your ~/.zshrc file.

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


