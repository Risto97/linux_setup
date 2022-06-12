#!/bin/bash

mkdir -p ~/.config

rm ~/.config/compton.conf
ln -s $(pwd)/compton.conf ~/.config

rm -rf ~/.config/i3
ln -s $(pwd)/i3/ ~/.config/

rm ~/.spacemacs
ln -s $(pwd)/.spacemacs ~/.spacemacs

rm ~/.xinitrc
ln -s $(pwd)/.xinitrc ~/.xinitrc

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

./nvim_install.sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

rm ~/.config/.bash_customrc
ln -s $(pwd)/.bash_customrc ~/.config/
echo 'source ~/.config/.bash_customrc' > ~/.bashrc

wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-v0.21.0-x86_64-unknown-linux-musl.tar.gz
tar -xzvf bat-v0.21.0-x86_64-unknown-linux-musl.tar.gz
mv bat-v0.21.0-x86_64-unknown-linux-musl/bat ~/.local/bin
rm -rf bat-v*

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
mkdir hack_tmp
unzip Hack-v3.003-ttf.zip -d hack_tmp/
mv hack_tmp/ttf/Hack* ~/.fonts
rm -rf Hack-v*
fc-cache -fv
rm -rf hack_tmp

wget https://github.com/jesseduffield/lazygit/releases/download/v0.20.9/lazygit_0.20.9_Linux_x86_64.tar.gz
mkdir lazygit
tar -xzvf lazygit_0.20.9_Linux_x86_64.tar.gz --directory lazygit
mv lazygit/lazygit ~/.local/bin
rm -rf lazygit
