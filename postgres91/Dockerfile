from	ubuntu:12.04

# Configure apt
run	echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run	apt-get -y update

# Make data directory for configuration and database storage
run	mkdir /data
run	mkdir /data/pg_db
run	mkdir /data/pg_conf
run	ln -s /data/pg_db /var/lib/postgresql
run	ln -s /data/pg_conf /etc/postgresql

# Install PostgreSQL
run	LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-9.1

run	sed -i -e "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /data/pg_conf/9.1/main/postgresql.conf 
run	sed -i -e "s@127.0.0.1/32@0.0.0.0/0@" /data/pg_conf/9.1/main/pg_hba.conf
run	sed -i -e "s@::1/128@::/0@" /data/pg_conf/9.1/main/pg_hba.conf
run	tar -C /data -czvf /etc/postgresql.tgz pg_conf

env     POSTGRES_DBA_PW toor
env	CHARSET UTF8
add	./start_postgres.sh	/start_postgres.sh
expose	5432

cmd	["sh", "/start_postgres.sh"]

# vim:ts=8:noet:
