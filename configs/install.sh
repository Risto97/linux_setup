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
