#!/bin/bash

#Read input to enter hostname
read -p "Enter in your desired hostname: " hostname

echo "Changing hostname to $hostname..."
sudo hostnamectl set-hostname --static $hostname

#Update the system
sudo dnf update --refresh

#Enable RPM Fusion Repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install Microsoft Edge
flatpak install flathub com.microsoft.Edge

#Install Microsoft Fonts 
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

#Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

#Install Steam
sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam
sudo dnf install steam

#Install Discord
sudo dnf install discord

#Setup Driverless Printing https://fedoraproject.org/wiki/How_to_debug_printing_problems#How_to_find_out_whether_my_printer_is_capable_of_driverless_printing?
sudo systemctl start avahi-daemon
sudo systemctl enable cups.socket
sudo systemctl start cups.socket
sudo dnf install avahi-tools

read -p "All done! Press enter to continue"
