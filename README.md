# envport

Required packages on most systems for normal nvim: gcc, make, cmake, git

bash scripts/install.sh

#required packages for this nvim's lsp config: unzip, g++ (for clangd), npm (for pyright)

!! ruff on debian needs build essentials/cargo/pkg-config probably due to some glibc shenanigans, ubuntu seems fine without it


expects xclip or wayclip for clipboard




---------------------------------------

install.sh:

---------------------------------------

git clone https://github.com/neovim/neovim

cd neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo

cd build

mkdir ../INSTALL

cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/../INSTALL ..

make install




echo 'export PATH="$PATH:$HOME/gdir/neovim/INSTALL/bin"' >> ~/.bashrc

echo 'export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/gdir/neovim/INSTALL/share"' >> ~/.bashrc

echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/gdir/neovim/INSTALL/lib64"' >> ~/.bashrc

echo "alias n='nvim'" >> ~/.bashrc


source ~/.bashrc 



cd ~/.config/

git clone https://github.com/rgbforge/nvim.git
