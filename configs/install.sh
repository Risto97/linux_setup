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

./nvim_install.sh
