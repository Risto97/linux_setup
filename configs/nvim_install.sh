#!/bin/bash

mkdir -p ~/.local/bin
wget --directory-prefix=$HOME/.local/bin https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage
mv ~/.local/bin/nvim.appimage ~/.local/bin/nvim
rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source ~/.bashrc
nvm install node
pip3 install pynvim --user
npm install --prefix $HOME/.local/bin yarn

