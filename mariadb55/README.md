## Usage

If you want to store MySQL data on the host, at `/data/mysql`:

    docker pull nickstenning/mariadb55
    docker run -v /data/mysql/var/lib/mysql \
               -e MARIADB_ROOT_PW=password123 \
               -d nickstenning/mariadb55
