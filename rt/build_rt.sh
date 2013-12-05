#!/bin/sh

set -e

tar -C /src -xzpvf /src/${RTSRC}
cd /src/${RT} && ./configure --with-db-type=Pg
make -C /src/${RT} testdeps
make -C /src/${RT} install

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
