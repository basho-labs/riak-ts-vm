#!/bin/bash

source /vagrant/scripts/vars.sh

#install spark
echo "Install Spark"
sudo wget -nc -nv http://d3kbcqa49mib13.cloudfront.net/${SPARK_ARCHIVE} -P /usr/local/src/
sudo mkdir -p /usr/local/src/spark
sudo tar xvf /usr/local/src/${SPARK_ARCHIVE} -C /usr/local/src/spark

grep -q -F 'SPARK_HOME=/usr/local/src/spark/${SPARK_BASE_DIR}' /etc/profile || sudo echo "SPARK_HOME=/usr/local/src/spark/${SPARK_BASE_DIR}" >> /etc/profile
source /etc/profile
export PATH=$PATH:$SPARK_HOME/bin
echo "... done"