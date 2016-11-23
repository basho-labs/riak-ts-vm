#!/bin/bash

# python upgrade to 2.7.11+ ppt
# http://serverfault.com/questions/669859/how-can-i-upgrade-python-to-2-7-9-on-ubuntu-14-4
echo "Add python ppa"
sudo add-apt-repository -y ppa:fkrull/deadsnakes-python2.7

# openjdk ppa
echo "Add java ppa" 
sudo add-apt-repository -y ppa:openjdk-r/ppa

#install chrome
echo "Add chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#update base install
echo "Init update/upgrade"
sudo apt-get update
sudo apt-get -y upgrade
    
# install window manager 
# https://blog.versioneye.com/2015/05/05/setting-up-a-dev-environment-with-vagrant/
sudo apt-get install -y xfce4 slim git-all unzip tree virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 dictionaries-common gnome-icon-theme-full tango-icon-theme libevent-dev libpng-dev libjpeg8-dev libfreetype6-dev htop python-dev build-essential google-chrome-stable
sudo setxkbmap -layout gb
# start xfce4 as non priviliged user
echo "Allow non priv users to start X"
sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

#utf8 settings
echo "Set default UTF8 lang settings to US English."
grep -q -F 'LANG=en_US.UTF-8' /etc/environment || sudo echo 'LANG=en_US.UTF-8' >> /etc/environment
grep -q -F 'LANGUAGE=en_US.UTF-8' /etc/environment || sudo echo 'LANGUAGE=en_US.UTF-8' >> /etc/environment
grep -q -F 'LC_ALL=en_US.UTF-8' /etc/environment || sudo echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
grep -q -F 'LC_CTYPE=en_US.UTF-8' /etc/environment || sudo echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment

# Configure file limits
# http://docs.basho.com/riak/kv/2.1.4/using/performance/open-files-limit/
echo "Configure ulimits"
grep -q -F 'session    required   pam_limits.so' /etc/pam.d/common-session || sudo echo 'session    required   pam_limits.so' >> /etc/pam.d/common-session
grep -q -F '* soft nofile 65536' /etc/security/limits.conf || sudo echo '* soft nofile 65536' >> /etc/security/limits.conf
grep -q -F '* hard nofile 65536' /etc/security/limits.conf || sudo echo '* hard nofile 65536' >> /etc/security/limits.conf

# http://forums.debian.net/viewtopic.php?f=10&t=101659
sudo /usr/share/debconf/fix_db.pl
dpkg-reconfigure dictionaries-common

#cleanup
echo "Cleanup..."
sudo apt-get -y autoremove
echo "... done"