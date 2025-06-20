cd $HOME/.config/nvim/
mkdir INSTALL
cd INSTALL
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/.config/nvim/INSTALL ..
make install
echo 'export PATH="$PATH:$HOME/.config/nvim/INSTALL/bin"' >> ~/.bashrc
echo 'export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.config/nvim/INSTALL/share"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.config/nvim/INSTALL/lib64"' >> ~/.bashrc
echo "alias n='nvim'" >> ~/.bashrc
