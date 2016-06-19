# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update
run	apt-get -y install python-software-properties
run	add-apt-repository ppa:chris-lea/node.js

# Install required packages
run	apt-get -y update
run	apt-get -y install nodejs git

# Install statsd
run	mkdir /src
run	git clone https://github.com/etsy/statsd.git /src/statsd
add	./config.js /src/statsd/config.js


##
## NB: This Dockerfile *WILL NOT WORK* until such time as Docker adds support
##     for UDP port forwarding.
##

# Statsd UDP port
expose	8125/udp
# Statsd Management port
expose	8126

cmd	["/usr/bin/node", "/src/statsd/stats.js", "/src/statsd/config.js"]

# vim:ts=8:noet:
