# DOCKER-VERSION 0.4.0

from	ubuntu:12.04
env	RT rt-4.2.1

# Install the RT source and scripts
env	RTSRC ${RT}.tar.gz
add	http://download.bestpractical.com/pub/rt/release/${RTSRC} /src/${RTSRC}
add	./rt-perl-modules /src/rt-perl-modules

## Set up APT
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -q -y update
# Install required packages
run	DEBIAN_FRONTEND=noninteractive apt-get -q -y install supervisor nginx-light perl-modules cpanminus build-essential libexpat1-dev libpq-dev cron postfix git spamassassin razor procmail logrotate graphviz gnupg libgd2-noxpm-dev

# Imstall dependencies
run	cpanm --force GD ## GD fails one of the tests
run	< /src/rt-perl-modules xargs cpanm

# vim:ts=8:noet:
