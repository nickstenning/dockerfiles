from    ubuntu:12.04

run     echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
run     apt-get -y update

# Install supervisord
run     apt-get -y install supervisor
run     apt-get -y install python-software-properties

# Install required packages
run     apt-get -y update
run     apt-get -y install python python-dev sqlite3 git-core python-pip python-virtualenv
run	apt-get -y install libjpeg-dev zlib1g-dev redis-server libxml2-dev libxslt-dev
run	apt-get -y install postgresql postgresql-server-dev-9.1

run	virtualenv --distribute mybooktype
run 	cd mybooktype
run	. /mybooktype/bin/activate

run	git clone https://github.com/sourcefabric/Booktype.git /mybooktype/Booktype
run	pip install -r /mybooktype/Booktype/requirements/postgresql.txt
run	pip install gunicorn

run	/mybooktype/Booktype/scripts/createbooki --database postgresql mybook
env	DJANGO_SETTINGS_MODULE mybook.settings
env	PYTHONPATH $PYTHONPATH://:/mybook/lib/:/mybooktype/Booktype/lib
env	BOOKTYPE_USER booktype
env	BOOKTYPE_PASS booktype
env	BOOKTYPE_DB   booktype

add	./settings.py /mybook/settings.py


#run	echo $(env) >/tmp/env
#run 	django-admin.py syncdb --noinput
#run	django-admin.py migrate
#run	django-admin.py createsuperuser --username='sysadmin' --email='sysadmin@okfn.org' --noinput

add     ./run-supervisord /usr/sbin/run-supervisord
add	./booktype.okfn.org.conf /etc/supervisor/conf.d/booktype.okfn.org.conf

expose  8000

cmd     ["/usr/sbin/run-supervisord"]

# vim:ts=8:noet:
