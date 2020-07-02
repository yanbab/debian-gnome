#!/bin/sh
#
# Minimal GNOME install for DEBIAN testing/unstable
#
# https://github.com/yanbab/debian-gnome/


### CONFIG ####

BROWSER="firefox"             # Choose your browser : firefox, firex-esr, chromium, epiphany-browser
VIRTUALBOX=true               # Install and compiile Virtualbox guest additions
MIRROR="fr"                   # Choose your mirror


### SYSTEM ###

# Upgrade Debian to unstable
echo "deb http://ftp.$MIRROR.debian.org/debian sid main contrib non-free" > /etc/apt/sources.list
apt upgrade; sudo apt dist-upgrade

# Core GNOME
apt install -y gnome-session

# Core GNOME utilities
apt install -y  --no-install-recommends \
  gnome-calculator \
  gnome-terminal \
  gnome-system-monitor \
  eog \
  evince \
  gedit 
  
# Core GNOME apps
apt install -y --no-install-recommends \
  nautilus  \
  nautilus-extension-gnome-termiinal
  
# Enable user file sharing
apt install -y --no-install-recommends \
  nautilus-share \
  user-gnome-share \
  samba

# Shell extensions
apt install -y --no-install-recommends -y \
  gnoome-shell-extension-dashtodock \
  gnoome-shell-extension-dash-to-panel \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-move-clock \
  gnome-shell-extension-desktop-icons \
  gnome-shell-extension-no-annoyance

# Web browser with gnome-shell integration
apt install -y $BROWSER chrome-gnome-shell 

# Enable plymoouth graphical boot
# Needed to get install progress on boot from gnome-software updates
apt install plymouth plymouth-themes
plymouth-set-default-theme -l           # list available plymouth themes
plymouth-set-default-theme -R spinner   # set simple default theme

# Manage network with Network-Manager
# (Fix 'unmanaged wired connectioon' error)
sed -i 's/managed=false/manage=true/g' /etc/NetworkManager/NetworkManager.conf


### END ###

# Clean up
apt autoremoove -y
apt clean

print("Upgrade ok, please reboot.")
