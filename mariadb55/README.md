## MariaDB 5.5

A simple MariaDB image with configurable root password and support for data volumes.

This image will run MariaDB 5.5 with a sensible default configuration. You can easily mount the data directory from the host using docker's data volume support, and can set the default root password for the instance with an environment variable.

For example, to set a root password of `password123` (please don't...) and put the MariaDB data in `/data/mysql` on the host, use the following:

    docker run -v /data/mysql:/var/lib/mysql \
           -e MARIADB_ROOT_PW=password123 \
           -d nickstenning/mariadb55

**NB**: Please be aware that by default docker will make the MariaDB port accessible from anywhere if the host firewall is unconfigured.

[1]: https://github.com/nickstenning/dockerfiles/tree/master/mariadb55
