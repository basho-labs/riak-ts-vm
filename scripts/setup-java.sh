#!/bin/bash

#install java 
sudo apt-get -fy install openjdk-8-jdk
grep -q -F 'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' /etc/profile || sudo echo 'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /etc/profile
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
source /etc/profile