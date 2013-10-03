# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update

# Install required packages
run	apt-get -y install supervisor nginx-light
run	curl -L http://cpanmin.us | perl - --sudo App::cpanminus

# Add system service config
add	./nginx.conf /etc/nginx/nginx.conf
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add graphite config
add	./initial_data.json /src/install.sh
run	/src/install.sh

# Nginx
expose	80

cmd	["/usr/bin/supervisord"]

# vim:ts=8:noet:
