#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install ubuntu desktop
sudo apt-get install -y --no-install-recommends ubuntu-desktop

# install language pack
sudo apt-get -y install `check-language-support -l de`

# set locale
sudo update-locale LANG=de_CH.UTF-8

# # install xrdp
sudo apt install xrdp -y
sudo apt install xorg-video-abi-24 -y
sudo apt install xserver-xorg-input-all -y
sudo apt install xorgxrdp -y

# # grant access
sudo adduser xrdp ssl-cert

# # restart xrdp
sudo systemctl stop xrdp
sudo systemctl start xrdp

# set password for ubuntu user
echo -e "ubuntu\nubuntu" | sudo passwd ubuntu

# set .xsession
echo gnome-session > /home/vagrant/.xsession
sudo chmod +x /home/vagrant/.xsession
sudo chown vagrant:vagrant /home/vagrant/.xsession

sudo cp /home/vagrant/.xsession /home/ubuntu/.xsession
sudo chmod +x /home/ubuntu/.xsession
sudo chown ubuntu:ubuntu /home/ubuntu/.xsession

# copy keymap
sudo cp /home/vagrant/files-prov/xrdp/km-00000807.ini /etc/xrdp/km-00000807.ini
sudo chmod 644 /etc/xrdp/km-00000807.ini

# copy polkit rule
sudo cp /home/vagrant/files-prov/xrdp/45-allow-colord.pkla /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla

# set version
UBUNTU_VERSION=$(lsb_release -a | grep Release | awk  '{print $2}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> ubuntu: $UBUNTU_VERSION with desktop" >> $application_file_path
