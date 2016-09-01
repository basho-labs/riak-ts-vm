#!/bin/bash

#install python stuff
#pkg-config needed for matplotlib
sudo apt-get -y install python-pip pkg-config libssl-dev libffi-dev 
sudo pip install virtualenv jupyter cryptography
