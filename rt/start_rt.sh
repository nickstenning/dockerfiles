#!/bin/sh

for dir in rt_conf rt_var rt_postfix; do
    if test ! -d /data/${dir}; then
        tar -C /data -xzvf /opt/rt.tgz ./${dir}
    fi
done

/usr/bin/supervisord
