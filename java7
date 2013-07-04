# DOCKER-VERSION 0.4.0

from ubuntu:12.04
run apt-get -y update
run apt-get -y install python-software-properties
run add-apt-repository ppa:webupd8team/java
run apt-get -y update
run echo "oracle-java7-installer  shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
run apt-get -y install oracle-java7-installer
