#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install ubuntu desktop
sudo apt-get install -y --no-install-recommends ubuntu-desktop

# install language pack
sudo apt-get -y install `check-language-support -l de`

# set locale
sudo update-locale LANG=de_CH.UTF-8

# set version
UBUNTU_VERSION=$(lsb_release -a | grep Release | awk  '{print $2}')
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> ubuntu: $UBUNTU_VERSION with desktop" >> $application_file_path
