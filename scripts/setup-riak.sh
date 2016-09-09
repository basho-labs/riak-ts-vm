#!/bin/bash

source /vagrant/scripts/vars.sh

#install riak and set up Riak 
echo "Download Riak TS"
sudo wget -nc -nv http://s3.amazonaws.com/downloads.basho.com/riak_ts/${RIAK_VERSION_MAJOR_MINOR}/${RIAK_VERSION}/ubuntu/trusty/${RIAK_ARCHIVE} -P /opt
echo "Install Riak TS"
cd /opt
sudo dpkg -i ${RIAK_ARCHIVE}
echo "... done"
echo "Riak TS: Set n_val = 1"
# http://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-doesnt-already-exist-using-sed
grep -q -F 'buckets.default.n_val = 1' ${RIAK_CONF} || sudo echo 'buckets.default.n_val = 1' >> ${RIAK_CONF}

echo "Riak TS: Set ring_size = 8"
grep -q -F 'ring_size = 8' ${RIAK_CONF} || sudo echo 'ring_size = 8' >> ${RIAK_CONF}

echo "Riak TS: Set leveldb.limited_developer_mem = on"
grep -q -F 'leveldb.limited_developer_mem = on' ${RIAK_CONF} || sudo echo 'leveldb.limited_developer_mem = on' >> ${RIAK_CONF}

echo "Riak TS: Set leveldb.threads = 7"
grep -q -F 'leveldb.threads = 7' ${RIAK_CONF} || sudo echo 'leveldb.threads = 7' >> ${RIAK_CONF}

#get riak spark connector
echo "Install Riak Spark Connector"
sudo mkdir -p /home/vagrant/spark-riak-connector
sudo wget -nc -nv https://bintray.com/artifact/download/basho/data-platform/com/basho/riak/spark-riak-connector/${RIAK_SPARK_CONNECTOR_VERSION}/spark-riak-connector-${RIAK_SPARK_CONNECTOR_VERSION}-uber.jar -P /home/vagrant/spark-riak-connector/
grep -q -F 'SPARK_CLASSPATH=/home/vagrant/spark-riak-connector/spark-riak-connector-${RIAK_SPARK_CONNECTOR_VERSION}-uber.jar' /etc/profile || sudo echo "SPARK_CLASSPATH=/home/vagrant/spark-riak-connectorspark-riak-connector-${RIAK_SPARK_CONNECTOR_VERSION}-uber.jar" >> /etc/profile
source /etc/profile
export PATH=$PATH:$SPARK_CLASSPATH/bin

sudo chown -Rv vagrant:vagrant /home/vagrant/spark-riak-connector

#set path in /etc/profile
echo "Set PATH"
sudo echo "PATH=$PATH:$SPARK_HOME/bin:$SCALA_HOME/bin:$JAVA_HOME/bin" >> /etc/profile
source /etc/profile
echo $PATH
