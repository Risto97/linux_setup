================================
My ARCH Linux installation notes
================================

**Create partition and make filesystem**

.. code-block:: bash

   cfdisk
   mkfs.ext4 /dev/sdxy

**Set system clock**

.. code-block:: bash

  timedatectl set-ntp true

**Mount arch partition and pacstrap arch**

login into installed arch

.. code-block:: bash

  mount /dev/sdxy /mnt
  pacstrap /mnt base base-devel
  genfstab -U /mnt >> /mnt/etc/fstab
  arch-chroot /mnt

**Set locale and system clock**

.. code-block:: bash

  ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
  hwclock --systohc

  vi /etc/locale.gen   # uncomment desired locale
  echo "LANG=en_US.UTF-8" >> /etc/locale.conf
  locale-gen

**Set host name**

.. code-block:: bash

  echo "risto" >> /etc/hostname
  create /etc/hosts contining
  127.0.0.1	localhost
  ::1		localhost
  127.0.1.1	risto.localdomain	risto

**Install Network Manager**

.. code-block:: bash

  pacman -S networkmanager
  systemctl enable NetworkManager

**Install and configure grub**

Need to update grub if on dual boot, (update-grub)
Check online how to configure grub.

.. code-block:: bash

   pacman -S grub

.. raw:: pdf

   PageBreak oneColumn

**Set root password, and add user**

.. code-block:: bash

  passwd

  useradd -m -g wheel risto
  passwd risto
  vi /etc/sudoers
  sudo usermod -a -G tty risto
  sudo usermod -a -G uucp risto

**Reboot PC and boot into ARCH**
--------------------------------

**Enable Network Manager**

network manager didnt start had to do it again

.. code-block:: bash

  systemctl enable NetworkManager
  systemctl start NetworkManager
  reboot

**Install Graphical environment (i3wm and slimDM)**
create .xinitrc if i3 doesnt start

.. code-block:: bash

  sudo pacman -S xf86-video-fbdev xf86-video-vesa # Not for PC, some devices need gpu-drivers like Zynq boards
  sudo pacman -S xorg-server xorg-xinit
  sudo pacman -S xterm # install xterm just to check if startx is working
  sudo pacman -S xdotool xorg-xev xorg-xprop

  sudo pacman -S i3-wm i3blocks xfce4-terminal rofi compton
  sudo pacman -S slim slim-themes
  sudo systemctl enable slim.service
  sudo vim /etc/slim.conf
  sudo pacman -S surfraw

  sudo pacman -S network-manager-applet

**Setup git, vim, emacs, python**

.. code-block:: bash

  sudo pacman -S vim git emacs python
  sudo pacman -S bash-completion
  sudo pacman -S openssh
  git config --global user.name "Risto Pejasinovic"
  git config --global user.email "risto.pejasinovic@gmail.com"

  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d --branch develop

**Install yay AUR helper**

.. code-block:: bash

  git clone https://aur.archlinux.org/yay.git ~/.yay
  cd ~/.yay
  makepkg -si
  yay -S yad-gtk2

**Install some apps**

.. code-block:: bash

  sudo pacman -S firefox thunderbird htop qalculate-gtk
  sudo pacman -S xfce4-screenshooter
  sudo pacman -S lxrandr arandr
  sudo pacman -S thunar gvfs thunar-volman tumbler engrampa unrar file-roller thunar-archive-plugin
  sudo pacman -S viewnior feh vlc
  sudo pacman -S transmission-gtk
  sudo pacman -S evince
  sudo pacman -S zathura zathura-pdf-mupdf zathura-djvu
  yay -S wps-office
  yay -S gitflow-git
  sudo pacman -S dunst libnotify
  sudo pacman -S rsync
  yay -S rofi-calc

**Clone git repo for config and scripts, and install**

.. code-block:: bash

  git clone https://github.com/Risto97/linux_setup.git ~/linux_setup/
  cd ~/linux_setup/configs
  ./install.sh
  cd ../scripts
  ./install.sh

**Install this for i3 scratchpad minimize script**

.. code-block:: bash

  sudo pacman -S pip-python
  pip install six

**Setup pyenv**

.. code-block:: bash

  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
  exec $BASH
  pyenv install 3.7.2
  pyenv global 3.7.2

**Search tools**

.. code-block:: bash

  sudo vim /etc/sudoers  # add this line %wheel ALL=(ALL) NOPASSWD: /usr/bin/updatedb
  sudo pacman -S mlocate
  sudo updatedb

  sudo pacman -S ripgrep

**Visuals**

.. code-block:: bash

  sudo pacman -S adobe-source-code-pro-fonts
  sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
  yay -S ttf-inconsolata

  yay -S papirus-maia-icon-theme-git
  sudo pacman -S lxappearance

**Setup tools directory**

.. code-block:: bash

  sudo mkdir /tools
  sudo chown -R risto /tools/

**Install Audio**

.. code-block:: bash

  sudo pacman -S alsa-lib alsa-plugins pulseaudio-alsa zita-alsa-pcmi alsa-utils pavucontrol

**Set aliases**

.. code-block:: bash

  echo "alias ll='ls -alF'" >> ~/.bashrc

**Create fstab, with gnome-disks**

.. code-block:: bash

  sudo pacman -S gnome-disk-utility

**Enable multilib uncomment lines in /etc/pacman.conf**

.. code-block:: bash

  sudo pacman -Sy multilib

**Install some graphic tools dependencies**

.. code-block:: bash

  sudo pacman -S graphviz
  sudo pacman -S tk
  sudo pacman -S gperf

**Install misc python packages**

.. code-block:: bash

   pip install yapf
   pip install autoflake
   sudo pacman -S clang
   yay -S cquery

**Vivado dependencies**

.. code-block:: bash

  yay -S ncurses5-compat-libs
  sudo pacman -S libpng12
  sudo pacman -S lib32-libpng12

**Linux Kernel for arm build deps**

.. code-block:: bash

   sudo pacman -S uboot-tools
   sudo pacman -S bc
   yay -S arm-linux-gnueabi-gcc


**Text formatting**

.. code-block:: bash

   sudo pacman -S texlive-most
   pip install Sphinx
   pip install sphinx-intl
   pip install sphinxcontrib-tikz
   sudo pacman -S biber
   pip install sphinxcontrib-bibtex
   sudo pacman -S texlive-langcyrillic
   sudo pacman -S  texlive-langextra
