# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update
run	apt-get -y install python-software-properties
run	add-apt-repository ppa:chris-lea/node.js

# Install required packages
run	apt-get -y update
run	apt-get -y install nodejs git-core curl python libssl-dev pkg-config build-essential

# Install etherpad-lite
run	mkdir /src
run	git clone https://github.com/ether/etherpad-lite.git /src/etherpad-lite
add	./settings.json /src/etherpad-lite/settings.json
run	/src/etherpad-lite/bin/installDeps.sh

expose	9001

entrypoint	["/src/etherpad-lite/bin/run.sh", "--root"]

# vim:ts=8:noet:
