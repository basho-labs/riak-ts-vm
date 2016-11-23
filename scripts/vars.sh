#!/bin/bash

echo "Init environment variables..."

# Riak
RIAK_VERSION=1.4.0
RIAK_VERSION_MAJOR_MINOR=`echo ${RIAK_VERSION} | awk -F'.' '{print $1"."$2}'`
RIAK_ARCHIVE=riak-ts_${RIAK_VERSION}-1_amd64.deb
RIAK_CONF=/etc/riak/riak.conf

#Riak Spark Connector
RIAK_SPARK_CONNECTOR_VERSION=1.5.1

# spark
SPARK_VERSION=2.0.0
SPARK_BASE_DIR=spark-${SPARK_VERSION}-bin-hadoop2.7
SPARK_ARCHIVE=${SPARK_BASE_DIR}.tgz
SPARK_MIRROR_DOWNLOAD=http://archive.apache.org/dist/spark/$SPARK_VERSION/$SPARK_VERSION-bin-hadoop2.6.tgz

#scala
SCALA_VERSION=2.11.8
SCALA_ARCHIVE=scala-${SCALA_VERSION}.tgz

echo "...done"