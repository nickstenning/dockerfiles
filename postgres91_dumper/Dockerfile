from	okfn/postgres:0.4

# Configure apt
run	apt-get -y install s3cmd bzip2

add	./dumper.sh /dumper.sh
add	./s3cfg /.s3cfg

env	AWS_ACCESS_KEY snake
env	AWS_SECRET_KEY oil

cmd	["sh", "/dumper.sh"]

# vim:ts=8:noet:
