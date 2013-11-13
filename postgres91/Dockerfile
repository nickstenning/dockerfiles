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

run	sed -i -e "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.1/main/postgresql.conf 
run	sed -i -e "s@127.0.0.1/32@0.0.0.0/0@" /etc/postgresql/9.1/main/pg_hba.conf
run	sed -i -e "s@::1/128@::/0@" /etc/postgresql/9.1/main/pg_hba.conf

env     POSTGRES_DBA_PW toor
run	/etc/init.d/postgresql start && echo "ALTER USER postgres WITH PASSWORD '${POSTGRES_DBA_PW}';" | su - postgres -c "psql template1"

expose	5432

cmd	["su", "-", "postgres", "-c", "/usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf"]

# vim:ts=8:noet:
