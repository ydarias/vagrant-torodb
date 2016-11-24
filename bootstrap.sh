#!/bin/bash

# Prepare repos

add-apt-repository ppa:webupd8team/java
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update repos

apt-get update -q

# Install Java 8

apt-get install -y python-software-properties
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
yes "" | apt-get -f install

# Install MongoDB
apt-get install -y mongodb-org language-pack-es
cp /home/ubuntu/mongod.service /lib/systemd/system/mongod.service
service mongod restart

# Install PostgreSQL

apt-get install -y postgresql postgresql-contrib
