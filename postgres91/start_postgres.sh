#!/bin/sh

pgrun () {
    su - postgres -c "$*"
}

if test ! -d /config/postgresql; then
    tar -C /config -xzvf /etc/postgresql.tgz
fi

if test ! -d /data/postgresql/9.1/main; then
    mkdir -p /data/postgresql/9.1
    chown postgres /data/postgresql/9.1
    pgrun /usr/lib/postgresql/9.1/bin/pg_ctl init -D /data/postgresql/9.1/main

    ### XXX This is what ubuntu does and is bad bad bad. Do a better job.
    ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /data/postgresql/9.1/main/server.crt
    ln -s /etc/ssl/private/ssl-cert-snakeoil.key /data/postgresql/9.1/main/server.key

    /etc/init.d/postgresql start
    echo "ALTER USER postgres WITH PASSWORD '${POSTGRES_DBA_PW}';" | pgrun psql template1
    /etc/init.d/postgresql stop
fi

pgrun /usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf
