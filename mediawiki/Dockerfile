from	ubuntu:14.04

# Configure apt
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ trusty universe' >> /etc/apt/sources.list
run	apt-get -y update

# Install prereqs
run	LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y \
    supervisor \
    nginx-light \
    php-apc \
    php-mail \
    php-net-smtp \
    php5-fpm \
    php5-gd \
    php5-intl \
    php5-mysqlnd \
    php5-pgsql

# Add system service config
add	./nginx.conf /etc/nginx/nginx.conf
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	./fpm.conf /etc/php5/fpm/php-fpm.conf
add	./fpm-pool-www.conf /etc/php5/fpm/pool.d/www.conf

# Install mediawiki
run	mkdir /src
add	http://download.wikimedia.org/mediawiki/1.26/mediawiki-1.26.3.tar.gz /src/mediawiki.tgz
run	cd /src && tar zxf mediawiki.tgz
run	ln -snf /src/mediawiki-1.26.3 /src/mediawiki
run	chown -R www-data:www-data /src/mediawiki/

# Add data directory and symlinks that can then be used as a data volume
run	mkdir /data
run	ln -s /data/LocalSettings.php /src/mediawiki/LocalSettings.php
run	rm -rf /src/mediawiki/images
run	ln -s /data/images /src/mediawiki/images

# Add startup script
add	./mediawiki-start /usr/bin/mediawiki-start

expose	80
cmd	["/usr/bin/mediawiki-start"]

# vim:ts=8:noet:
