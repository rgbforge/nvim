#git clone https://github.com/neovim/neovim
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
