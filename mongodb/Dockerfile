# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list
run	apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
run	apt-get -y update
run	apt-get -y install mongodb-10gen supervisor

# Add config
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	./init-replicaset.conf /etc/supervisor/conf.d/init-replicaset.conf
add	./mongodb.conf /etc/mongodb.conf
add	./start /src/start

# Mongo port
expose	27017
# NB: if run with the environment variable REPLSETMEMBERS, this container will
# start multiple instances of mongod on ports 27017, 27018, 27019, etc. You will
# need to manually open the ports with "docker run -p 27017 -p 27018 ...".

cmd	["sh", "/src/start"]

# vim:ts=8:noet:
