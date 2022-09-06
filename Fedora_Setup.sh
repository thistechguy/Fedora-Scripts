#!/bin/bash

#Update the system
sudo dnf update

#Install Google Chrome Beta
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-Beta

#Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

#Install Steam
sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam
sudo dnf install steam
