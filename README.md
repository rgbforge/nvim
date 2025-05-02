# envport

git clone https://github.com/neovim/neovim

cd neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo

cd build/

mkdir ../INSTALL

pwd

ccmake ..

use pwd for /path/to/neovim/INSTALL

make install




Edit ~/.bashrc 


export PATH="$PATH:/home/rgbforge/gdir/neovim/INSTALL/bin"

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/home/rgbforge/gdir/neovim/INSTALL/share"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/rgbforge/gdir/neovim/INSTALL/lib64"

alias n='nvim'


source ~/.bashrc 



cd ~/.config/

git clone https://github.com/rgbforge/nvim.git
