```
cfdisk
mkfs.ext4 /dev/sdxy

timedatectl set-ntp true
mount /dev/sdxy /mnt
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
hwclock --systohc

vi /etc/locale.gen   // uncomment locale
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "risto" >> /etc/hostname

create /etc/hosts contining
127.0.0.1	localhost
::1		localhost
127.0.1.1	risto.localdomain	risto

pacman -S networkmanager
systemctl enable NetworkManager

pacman -S grub
Need to update grub if on dual boot, (update-grub)
Or install from arch grub, check online for this step

passwd

useradd -m -g wheel risto
passwd risto
vi /etc/sudoers

boot into arch

systemctl enable NetworkManager // network manager didnt start had to do it again
systemctl start NetworkManager
reboot

sudo pacman -S xorg-server xorg-xinit
sudo pacman -S xterm // startx wont work without this, probably uneccesary with wm or de

sudo pacman -S i3wm i3blocks xfce4-terminal rofi compton
sudo pacman -S network-manager-applet

sudo pacman -S slim slim-themes
sudo systemctl enable slim.service
sudo vim /etc/slim.conf

sudo pacman -S vim git emacs python
git config --global user.name "Risto Pejasinovic"
git config --global user.email "risto.pejasinovic@gmail.com"

sudo pacman -S firefox thunderbird htop qalculate-gtk
sudo pacman -S thunar
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d --branch develop

git clone https://github.com/Risto97/linux_setup.git ~/linux_setup/
cd ~/linux_setup/configs
./install.sh

##### for system python pip #####
sudo pacman -S pip-python
##### for scratchpad windows script #####
pip install six

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec $BASH
pyenv install 3.7.2
pyenv global 3.7.2

sudo pacman -S adobe-source-code-pro-fonts
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts

git clone https://aur.archlinux.org/yay.git ~/.yay
cd ~/.yay
makepkg -si

yay -S yad

#### Automounting still doesnt work ####
sudo pacman -S gvfs
sudo pacman -S thunar-volman
sudo pacman -S thunar
sudo pacman -S tumbler
sudo pacman -S viewnior
sudo pacman -S feh

sudo pacman -S evince
yay -S wps-office
sudo pacman -S vlc

sudo pacman -S dunst
sudo pacman -S libnotify

sudo mkdir /tools
sudo chown -R risto /tools/

sudo pacman -S alsa-lib alsa-plugins pulseaudio-alsa zita-alsa-pcmi alsa-utils pavucontrol

echo "alias ll='ls -alF'" >> ~/.bashrc

#### mount your drives with gnome-disks ####
sudo pacman -S gnome-disk-utility

#### Enable multilib repo ###
### uncomment two lines in /etc/pacman.conf ###
[multilib]
Include = /etc/pacman.d/mirrorlist
sudo pacman -Sy multilib

sudo pacman -S graphviz
sudo pacman -S tk
sudo pacman -S xdotool
sudo pacman -S xorg-xprop
sudo pacman -S gperf

#### VIVADO ####
yay -S ncurses5-compat-libs
sudo pacman -S libpng12
sudo pacman -S lib32-libpng12

Enable network manager, disable DHCPCD
https://evilshit.wordpress.com/2012/09/15/how-to-make-networkmanager-and-network-manager-applet-work-on-arch-linux-with-gnome3/
```
