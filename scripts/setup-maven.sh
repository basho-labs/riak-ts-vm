#!/bin/bash

#install maven
sudo wget -nc -nv http://mirror.fibergrid.in/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -P /usr/local/src/
sudo mkdir -p /usr/local/src/mvn
sudo tar xvf /usr/local/src/apache-maven-3.3.9-bin.tar.gz -C /usr/local/src/mvn/
export PATH=$PATH:/usr/local/src/mvn/apache-maven-3.3.9/bin