# DOCKER-VERSION 0.4.0

from	okfn/rt-base:0.7

add     ./build_rt.sh /src/build_rt.sh
add     ./config_rt.sh /src/config_rt.sh

# Add system service config
add     ./nginx.conf /etc/nginx/nginx.conf
add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add     ./crontab.root /var/spool/cron/crontabs/root

# Configure Postfix
add     ./main.cf /etc/postfix/main.cf
add     ./aliases /etc/postfix/aliases
run	chown root:root /etc/postfix/main.cf /etc/postfix/aliases
run	newaliases

# Build RT and extensions
run	sh /src/build_rt.sh

# Configurate RT
add	./RT_SiteConfig.pm /opt/rt4/etc/RT_SiteConfig.pm
run	sh /src/config_rt.sh

add     ./start_rt.sh /start_rt.sh
cmd	["/start_rt.sh"]

# vim:ts=8:noet:
