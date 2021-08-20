#! /bin/bash

{
sudo useradd -m google
sudo adduser google sudo
echo 'google:google' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser google chrome-remote-desktop
} &> /dev/null &&
printf "\nChrome Setup Complete " >&2 ||
printf "\nChrome Error Occured " >&2

printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - google -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'

if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi

{
sudo curl -s -L -o /usr/bin/ray https://github.com/xuiv/v2ray-heroku/releases/download/1.01/ray-linux
sudo curl -s -L -o /usr/bin/config.json https://github.com/xuiv/v2ray-heroku/releases/download/1.01/serverconfig.json
sudo chmod +x /usr/bin/ray
sudo sed -i 's/env:PORT/80/g' /usr/bin/config.json
} &> /dev/null &&
printf "\nV2ray Setup Complete " >&2 ||
printf "\nV2ray Error Occured " >&2

printf  "\nThis Computer IP: " >&2
echo ` curl https://www.trackip.net/i 2> /dev/null |sed -r 's#[^0-9]*([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*#\1#' |sed -r '/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/!d' |sed -n '1p' `
ray &
