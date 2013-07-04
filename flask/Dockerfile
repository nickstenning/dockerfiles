# DOCKER-VERSION 0.4.0

from ubuntu:12.04
run echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run apt-get -y update
run apt-get -y install python python-pip build-essential
run pip install flask flask-sqlalchemy
run apt-get -y purge build-essential
run apt-get -y autoremove