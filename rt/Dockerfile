# DOCKER-VERSION 0.4.0

from	okfn/rt-base:0.16

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

add	./procmailrc.rt /etc/postfix/procmailrc.rt
run	mkdir /var/log/procmail
run	chmod 1777 /var/log/procmail
add	./logrotate.procmail /etc/logrotate.d/procmail

# Build RT and extensions
run	sh /src/build_rt.sh
add	./MakeClicky /opt/rt4/local/html/Callbacks/MyCallbacks/Elements/MakeClicky/Default

# Configurate RT
add	./RT_SiteConfig.pm /opt/rt4/etc/RT_SiteConfig.pm
run	sh /src/config_rt.sh

# Make cron not complain
run	touch /etc/mtab

add     ./start_rt.sh /start_rt.sh
cmd	["/start_rt.sh"]

# vim:ts=8:noet:
