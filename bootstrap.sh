#!/bin/bash

: ${HADOOP_HOME:=/usr/local/hadoop}

. /etc/docker-startup/bootstrap.sh
$HADOOP_HOME/bin/hdfs dfsadmin -safemode leave

cp /jdbc/* $SQOOP_HOME/lib

/bin/bash
