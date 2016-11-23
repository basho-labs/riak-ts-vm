#!/bin/bash

source /vagrant/scripts/vars.sh

# get the scala tarball
echo "Install Scala"
sudo wget -nc -nv http://downloads.lightbend.com/scala/${SCALA_VERSION}/${SCALA_ARCHIVE} -P /usr/local/src/
sudo mkdir -p /usr/local/src/scala
sudo tar xvf /usr/local/src/${SCALA_ARCHIVE} -C /usr/local/src/scala/
#scala export
grep -q -F 'SCALA_HOME=/usr/local/src/scala/scala-${SCALA_VERSION}' /etc/profile || sudo echo "SCALA_HOME=/usr/local/src/scala/scala-${SCALA_VERSION}" >> /etc/profile
source /etc/profile
export PATH=$PATH:$SCALA_HOME/bin
echo "... done"