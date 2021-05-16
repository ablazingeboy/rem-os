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

    'wget'                  # Remote content retrieval
    'htop'                  # Process viewer
    'neofetch'              # Shows system info

    # GENERAL UTILITIES ---------------------------------------------------

    'fbv'                   # Framebuffer image viewer
    'fortune-mod'           # Fortune
    'catimg'                # Image backend

    # DEVELOPMENT ---------------------------------------------------------

    'micro'                 # Text editor
    'git'                   # Version control system
    'python'                # Scripting language


)

for PKG in "${PKGS[@]}"; do
    echo "Installing ${PKG}, $USER-sama"
    sudo xbps-install -S -y "$PKG" 
done

echo -e "\nDone installing packages, $USER-sama!\n"

#-------------------------------------------------------------------------

echo -e "\nJust doing a little housekeeping, master"

# ------------------------------------------------------------------------

echo -e "\nWriting a few notes for you, master."

DIRECTORY=$(cd `dirname $0` && pwd)

strfile $DIRECTORY/resources/remquotes
sudo rm -rf /usr/share/fortune/*
sudo mv $DIRECTORY/resources/remquotes $DIRECTORY/resources/remquotes.dat /usr/share/fortune/

# ------------------------------------------------------------------------

echo -e "\nBuilding yaft, master."

mkdir $HOME/git
cd $HOME/git
git clone https://github.com/uobikiemukot/yaft
rm $HOME/git/yaft/conf.h
mv $DIRECTORY/resources/conf.h $HOME/git/yaft/
export LANG=en_US.UTF-8
make
make install
sudo mv $DIRECTORY/resources/bg.jpg /

# ------------------------------------------------------------------------

echo -e "\nMoving files, master."

mv $DIRECTORY/resources/neofetch/config.conf $HOME/.config/neofetch/
mv $DIRECTORY/resources/bg.jpg $HOME
mv $DIRECTORY/resources/rempixel.png $HOME
mv $DIRECTORY/resources/.bashrc $HOME

# ------------------------------------------------------------------------

echo -e"\nSetting your keymap to Colemak, $USER-sama\n"

sudo sed -i -e "s|#\?KEYMAP=.*|KEYMAP=colemak|" /etc/rc.conf

cd $pwd
echo "
###############################################################################
# Done! Enjoy your system, $USER-sama! Make sure to restart!
###############################################################################
"