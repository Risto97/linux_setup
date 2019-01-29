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

sudo pacman -S i3wm i3blocks xfce4-terminal rofi
sudo pacman -S network-manager-applet

sudo pacman -S slim slim-themes
sudo systemctl enable slim.service
sudo vim /etc/slim.conf

sudo pacman -S vim git emacs python
git config --global user.name "Risto Pejasinovic"
git config --global user.email "risto.pejasinovic@gmail.com"

sudo pacman -S firefox thunderbird htop qalculate-gtk
sudo pacman -S thunar
git clone git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d --branch develop

git clone https://github.com/Risto97/linux_setup.git ~/linux_setup/
cd ~/linux_setup/configs
./install.sh




Enable network manager, disable DHCPCD
https://evilshit.wordpress.com/2012/09/15/how-to-make-networkmanager-and-network-manager-applet-work-on-arch-linux-with-gnome3/
