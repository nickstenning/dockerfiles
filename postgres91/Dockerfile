from	ubuntu:12.04

# Configure apt
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update

# Make data directory for configuration and database storage
run	mkdir /data /data/postgresql
run	mkdir /config /config/postgresql
run	ln -s /data/postgresql /var/lib
run	ln -s /config/postgresql /etc

# Install PostgreSQL
run	LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-9.1

run	sed -i -e "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /config/postgresql/9.1/main/postgresql.conf 
run	sed -i -e "s@127.0.0.1/32@0.0.0.0/0@" /config/postgresql/9.1/main/pg_hba.conf
run	sed -i -e "s@::1/128@::/0@" /config/postgresql/9.1/main/pg_hba.conf
run	tar -C /config -czvf /etc/postgresql.tgz postgresql

env     POSTGRES_DBA_PW toor
add	./start_postgres.sh	/start_postgres.sh
expose	5432

cmd	["sh", "/start_postgres.sh"]

# vim:ts=8:noet:
