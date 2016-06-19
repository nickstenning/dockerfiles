# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update
run	apt-get -y install ruby1.9.1 ruby1.9.1-dev git supervisor redis-server build-essential libcurl4-openssl-dev
run	gem1.9.1 install bundler

# Install graphiti
run	mkdir /src
run	git clone https://github.com/paperlesspost/graphiti.git /src/graphiti
run	cd /src/graphiti && bundle install --deployment --without 'test development'

# Add config
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	./unicorn.rb /src/graphiti/config/unicorn.rb
add	./settings.yml /src/graphiti/config/settings.yml

# Unicorn port
expose	8080
# Redis port
expose	6379

cmd	["/usr/bin/supervisord"]

# vim:ts=8:noet:
