#!/bin/bash

mkdir -p ~/.config

rm ~/.config/compton.conf
ln -s $(pwd)/compton.conf ~/.config

rm -rf ~/.config/i3
ln -s $(pwd)/i3/ ~/.config/

rm ~/.spacemacs
ln -s $(pwd)/.spacemacs ~/.spacemacs

rm -rf ~/.config/rofi
ln -s $(pwd)/rofi/ ~/.config/

mkdir -p ~/.fonts
cp fonts/fontawesome-webfont.ttf ~/.fonts

rm -rf ~/.config/dunst
ln -s $(pwd)/dunst ~/.config/

rm -rf ~/.config/htop
ln -s $(pwd)/htop ~/.config/

mkdir -p ~/.config/xfce4/
rm -rf ~/.config/xfce4/terminal
ln -s $(pwd)/xfce4/terminal ~/.config/xfce4/terminal

mkdir -p ~/.local/share/applications/
rm ~/.local/share/applications/emacsclient.desktop
ln -s $(pwd)/mimeapps/applications/emacsclient.desktop ~/.local/share/applications/emacsclient.desktop

rm ~/.config/mimeapps.list
ln -s $(pwd)/mimeapps/mimeapps.list ~/.config/mimeapps.list

rm -rf ~/.config/Thunar
ln -s $(pwd)/Thunar ~/.config/

rm -rf ~/.config/surfraw
ln -s $(pwd)/surfraw ~/.config/

rm -rf ~/.config/ranger
ln -s $(pwd)/ranger ~/.config/

rm -rf ~/.config/qutebrowser
ln -s $(pwd)/qutebrowser/ ~/.config/

rm -rf ~/.config/mpv
ln -s $(pwd)/mpv/ ~/.config/

rm -rf ~/.config/feh
ln -s $(pwd)/feh/ ~/.config/

rm -rf ~/.Xdefaults
ln -s $(pwd)/.Xdefaults ~/

rm -rf ~/.fzf.bash
ln -s $(pwd)/.fzf.bash ~/

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


