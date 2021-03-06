#!/usr/bin/env bash
#  _ __ ___ _ __ ___         ___  ___
# | '__/ _ \ '_ ` _ \ _____ / _ \/ __|
# | | |  __/ | | | | |_____| (_) \__ \
# |_|  \___|_| |_| |_|      \___/|___/
#
# Install Script
# Made by ablazingeboy#7375
# Why the fxxk did I spend time on this

echo -e "\nInstalling necessary software, $USER-sama. No bloat, I promise.\n"

PKGS=(

    'base-devel'            # Dev tools
    'wget'                  # Remote content retrieval
    'htop'                  # Process viewer
    'fbv'                   # Framebuffer image viewer
    'fortune-mod'           # Fortune
    'catimg'                # Image backend
    'micro'                 # Text editor
    'python3'               # Scripting language
    'python3-pip'           # Package manager for python
    'lazygit'               # Git client

)

for PKG in "${PKGS[@]}"; do
    echo "Installing ${PKG}, $USER-sama"
    sudo xbps-install -S -y "$PKG" 
done

echo -e "\nDone installing packages, $USER-sama!\n"

micro -plugin install filemanager

# ------------------------------------------------------------------------

echo -e "\nWriting a few notes for you, $USER-sama."

DIRECTORY=$(cd `dirname $0` && pwd)

strfile $DIRECTORY/resources/remquotes
sudo rm -rf /usr/share/fortunes/*
sudo mv $DIRECTORY/resources/remquotes $DIRECTORY/resources/remquotes.dat /usr/share/fortunes/

# ------------------------------------------------------------------------

echo -e "\nBuilding yaft, $USER-sama."

cd $HOME
git clone https://github.com/uobikiemukot/yaft
cd yaft
rm conf.h
cp $DIRECTORY/resources/conf.h $HOME/yaft/
export LANG=en_US.UTF-8
make
sudo make install

# ------------------------------------------------------------------------

echo -e "\nMoving files, $USER-sama."

cp $DIRECTORY/resources/bg.jpg $HOME
cp $DIRECTORY/resources/rempixel.png $HOME
cp $DIRECTORY/resources/.bashrc $HOME
cp $DIRECTORY/resources/micro/settings.json $HOME/.config/micro
mkdir $HOME/bin
cp $DIRECTORY/resources/ufetch-rem $HOME/bin
chmod +x $HOME/bin/ufetch-rem

# ------------------------------------------------------------------------

echo -e "\nSetting your keymap to Colemak, $USER-sama\n"

sudo sed -i -e "s|#\?KEYMAP=.*|KEYMAP=colemak|" /etc/rc.conf

cd $pwd
echo "
###############################################################################
# Done! Enjoy your system, $USER-sama! Make sure to restart!
###############################################################################
"