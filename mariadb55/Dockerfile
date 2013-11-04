from	ubuntu:12.04

# Configure apt
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update
run	apt-get -y install python-software-properties
run	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
run	add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu precise main'

# Make apt and MariaDB happy with the docker environment
run	echo "#!/bin/sh\nexit 101" >/usr/sbin/policy-rc.d
run	chmod +x /usr/sbin/policy-rc.d
run	cat /proc/mounts >/etc/mtab

# Install MariaDB
run	apt-get -y update
run	apt-get -y install 
run	LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server
run	LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y expect

# Clean up
run	rm /usr/sbin/policy-rc.d
run	rm -r /var/lib/mysql

# Default root password: can be overridden at the docker command line
env	MARIADB_ROOT_PW toor
# Add config
add	./my.cnf /etc/mysql/my.cnf

expose	3306

add	./mariadb-secureinstallation /usr/bin/mariadb-secureinstallation
add	./mariadb-setrootpassword /usr/bin/mariadb-setrootpassword
add	./mariadb-start /usr/bin/mariadb-start
cmd	["/usr/bin/mariadb-start"]

# vim:ts=8:noet:
