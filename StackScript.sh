#!/bin/bash

# create a directory for the installation files
mkdir Files

# Update and upgrade apt

echo "updating and upgrading apt ..."
sudo apt update -y && sudo apt upgrade -y

# install make
echo "installing make ..."
sudo apt install make -y

# install gcc
echo "installing gcc compiler ..."
sudo apt install gcc -y

# install Curl
echo "installing curl ..."
sudo apt install curl -y

# Install git
echo "installing git ..."
sudo apt install git -y

# install brave
echo "installing brave ..."
snap install brave -y

# install tailscale
# https://tailscale.com/kb/1031/install-linux
echo "installing tailscale ..."
curl -fsSL https://tailscale.com/install.sh | sh 


# install vim
echo "installing vim ..."
sudo apt install vim

# install go 
# needs to be installed with --classic flag
echo "installing go ..."
sudo snap install go --classic

# install hugo
sudo snap install hugo

# install image magick
# https://unixhint.com/install-imagemagick-on-ubu-ntu-24-04/
# The installation instructions below did not work, failed with make, so going for version 6 using repository version
sudo apt install imagemagick

# echo "installing magick ..."
# wget https://imagemagick.org/archive/ImageMagick.tar.gz
# tar xzf ImageMagick.tar.gz
# cd ImageMagick-7.1.1-45
# ./configure
# make
# sudo make install
# sudo ldconfig /usr/local/lib
# magick -version

# Install pandoc
# https://pandoc.org/installing.html
sudo apt install pandoc
sudo apt install texlive

# Install imageJ
# https://www.ubuntuupdates.org/package/core/noble/universe/base/imagej
sudo apt install imagej -y

# Install R
# https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html
sudo apt-get update -y
sudo apt-get install r-base -y
sudo apt-get install r-base-dev -y

# Install R studio
# https://posit.co/download/rstudio-server/
sudo add-apt-repository universe -y
sudo apt-get install gdebi-core -y

## Set the secure gpg keyes
## https://posit.co/code-signing/
gpg --keyserver keys.openpgp.org --search-keys 51C0B5BB19F92D60

## Download and install r studio for desktop
https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.12.1-563-amd64.deb
sudo gdebi rstudio-2024.12.1-563-amd64.deb -y

## Download and install r studio server
#
wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.12.1-563-amd64.deb
sudo gdebi rstudio-server-2024.12.1-563-amd64.deb -y

## Install shiny server
## https://posit.co/download/shiny-server/
sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-20.04/x86_64/shiny-server-1.5.23.1030-amd64.deb
sudo gdebi shiny-server-1.5.23.1030-amd64.deb

# Install csvkit
sudo apt install csvkit -y

# Install anaconda

# Install samba(?)

# Install tmux
sudo apt install tmux -y

# Install borg
# https://borgbackup.readthedocs.io/en/stable/installation.html#distribution-package
sudo apt install borgbackup -y

# Install wine to run windows applications
# https://www.cherryservers.com/blog/install-wine-ubuntu
# will leave it here for now 

# Remapping of capslock and esc
# https://github.com/rvaiya/keyd
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
sudo systemctl enable keyd --now

echo "
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock
">> /etc/keyd/default.conf

sudo keyd reload


