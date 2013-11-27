# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
env	RT rt-4.2.1

run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -q -y update

# Install required packages
run	DEBIAN_FRONTEND=noninteractive apt-get -q -y install supervisor nginx-light perl-modules cpanminus build-essential libexpat1-dev libpq-dev cron postfix

# Install RT dependencies
add	./rt-perl-modules /src/rt-perl-modules
run	< /src/rt-perl-modules xargs cpanm

# Install the RT source
env	RTSRC ${RT}.tar.gz
add	http://download.bestpractical.com/pub/rt/release/${RTSRC} /src/${RTSRC}
run	tar -C /src -xzpvf /src/${RTSRC}
run	cd /src/${RT} && ./configure --with-db-type=Pg
run	make -C /src/${RT} testdeps
run	make -C /src/${RT} install
add	./RT_SiteConfig.pm /opt/rt4/etc/RT_SiteConfig.pm

# Add system service config
add	./nginx.conf /etc/nginx/nginx.conf
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	./crontab.root /var/spool/cron/crontabs/root

# Configure Postfix
add	./main.cf /etc/postfix/main.cf
add	./aliases /etc/postfix/aliases
run	chown root:root /etc/postfix/main.cf /etc/postfix/aliases
run	newaliases

# Allow external config
add	extcfg.sh /extcfg.sh
run	sh /extcfg.sh && rm /extcfg.sh

add	start_rt.sh /start_rt.sh
cmd	["/start_rt.sh"]

# vim:ts=8:noet:
