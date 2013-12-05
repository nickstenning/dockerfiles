#!/bin/sh

set -e

mkdir /data
mv /opt/rt4/etc /data/rt_conf
mv /opt/rt4/var /data/rt_var
mv /etc/postfix /data/rt_postfix
ln -s /data/rt_conf /opt/rt4/etc
ln -s /data/rt_var /opt/rt4/var
ln -s /data/rt_postfix /etc/postfix
tar -C /data -czvf /opt/rt.tgz ./
