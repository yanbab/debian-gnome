#!/bin/sh
#
# Minimal GNOME install for DEBIAN testing/unstable
#
# https://github.com/yanbab/debian-gnome/


### CONFIG ####

APPS="gnome-contacts gnome-todo gnome-calendar gnome-software yelp"
BROWSER="firefox"
VIRTUALBOX=true
USER=1000


### SYSTEM ###

# Upgrade Debian to unstable
echo "deb http://ftp.fr.debian.org/debian sid main contrib non-free" > /etc/apt/sources.list
apt upgrade; sudo apt dist-upgrade

# Core GNOME
apt install -y gnome-session
  gnome-software \

# Core GNOME utilities
apt install -y \
  gnome-calculator \
  gnome-system-monitor \
  eog \
  evince \
  gedit 

# Core GNOME apps
apt install -y --no-install-recommends \
  gnome-terminal \
  nautilus \
  
# Core GNOME apps
apt install --no-install-recommends -y  $APPS 

# Web browser with gnome-shell integration
apt install -y \
  $BROWSER \
  chrome-gnome-shell 

# Enable user file sharing
apt install -y --no-install-recommends \
  nautilus-share \
  user-gnome-share \
  samba

# Enable plymoouth graphical boot
# Needed to get install progress on boot from gnome-software
apt install plymouth plymouth-themes
plymouth-set-default-theme -l           # list available plymouth themes
plymouth-set-default-theme -R spinner   # set simple default theme

# Clean up
apt autoremoove -y
apt clean

### END ###

print("Upgrade ok, please reboot.")






