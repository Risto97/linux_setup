#!/bin/bash

mkdir -p ~/bin
wget --directory-prefix=$HOME/bin https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod +x ~/bin/nvim.appimage
mv ~/bin/nvim.appimage ~/bin/nvim
rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node
pip3 install pynvim --user
npm install --prefix $HOME/bin yarn
echo 'export PATH=$PATH:$HOME/bin/node_modules/yarn/bin' >> ~/.bashrc

