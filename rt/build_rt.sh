#!/bin/sh

set -e

tar -C /src -xzpvf /src/${RTSRC}
cd /src/${RT} && ./configure --with-db-type=Pg
make -C /src/${RT} testdeps
make -C /src/${RT} install
