#!/bin/bash

mkdir -p /home/vagrant
cd /home/vagrant

echo "Cloning Aarhus repo"
git clone https://github.com/siculars/riak-ts-aarhus-demo.git

cd riak-ts-aarhus-demo

echo "Setting up virtualenv"
virtualenv .

source ./bin/activate

echo "Installing requirements"
pip install -r requirements.txt

echo "Unzipping demo data"
unzip -n demo-data-extract.csv.zip

export SPARK_CLASSPATH=/home/vagrant/spark-riak-connector
export SPARK_HOME=/usr/local/src/spark/spark-2.0.0-bin-hadoop2.7
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

sudo chown -Rv vagrant:vagrant `pwd`
