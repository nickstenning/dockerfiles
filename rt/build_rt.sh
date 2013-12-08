#!/bin/sh

set -e

tar -C /src -xzpvf /src/${RTSRC}
cd /src/${RT} && ./configure --with-db-type=Pg --enable-gpg --enable-gd --enable-graphviz
make -C /src/${RT} testdeps
make -C /src/${RT} install
mkdir -p /opt/rt4/var/data/gpg
chmod 700 /opt/rt4/var/data/gpg

install_ext() {
	REPO=$1
	cd /src
	git clone ${REPO}
	cd `basename ${REPO}`
	perl Makefile.PL
	make
	make install
}

install_ext https://github.com/bestpractical/rt-extension-mergeusers
install_ext https://github.com/bestpractical/rt-extension-resetpassword
install_ext https://github.com/bestpractical/rt-extension-activityreports
install_ext https://github.com/bestpractical/rt-extension-spawnlinkedticketinqueue
install_ext https://github.com/bestpractical/rt-extension-commandbymail
install_ext https://github.com/bestpractical/rt-extension-repeatticket
cp /src/rt-extension-repeatticket/bin/rt-repeat-ticket /opt/rt4/sbin

mkdir -p /opt/rt4/local/html/Callbacks/MyCallbacks/Elements/MakeClicky
