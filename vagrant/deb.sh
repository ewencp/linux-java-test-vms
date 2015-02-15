#!/bin/bash

set -e
set -x

apt-get -y update
apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
sudo apt-get upgrade -y

/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

sudo apt-get install -y oracle-java6-installer oracle-java6-set-default
