#!/usr/bin/env bash

# Set Environment Variables
source <(./bin/uno env) 
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"

# Generate ssh keys for localhost connections
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Start a ssh server for sshing into the localhost
/etc/init.d/ssh start

# Setup accumulo
./bin/uno setup accumulo

# Start Container in an iteractive mode
exec /bin/bash