#!/bin/sh

mkdir /data
mv /opt/rt4/etc /data/rt_conf
mv /opt/rt4/var /var/rt_var
mv /etc/postfix /data/rt_postfix
mv /etc/nginx /data/rt_nginx
ln -s /data/rt_conf /opt/rt4/etc
ln -s /data/rt_var /opt/rt4/var
ln -s /data/rt_postfix /etc/postfix
ln -s /data/rt_nginx /etc/nginx
tar -C /data -czvf /opt/rt.tgz ./
