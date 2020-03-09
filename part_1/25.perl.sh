#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
}

build(){
	sed -e '9751 a#ifndef PERL_IN_XSUB_RE' \
    -e '9808 a#endif'                  \
    -i regexec.c

	sh Configure -des -Dprefix=/tools -Dlibs=-lm -Dlibs=-lm -Uloclibpth -Ulocincpth			|| return
	make													|| return
	cp -v perl cpan/podlators/scripts/pod2man /tools/bin	|| return
	mkdir -pv /tools/lib/perl5/5.30.1						|| return
	cp -Rv lib/* /tools/lib/perl5/5.30.1					|| return
}

teardown(){
	cd $LFS/sources
	rm -rfv $dir_name
}

# Internal process

if [ $status -eq 0 ]; then
	setup >> $LFS/sources/$dir_name.log 2>&1
	status=$?
fi

if [ $status -eq 0 ]; then
	build >> $LFS/sources/$dir_name.log 2>&1
	status=$?
fi

if [ $status -eq 0 ]; then
	teardown >> $LFS/sources/$dir_name.log 2>&1
	status=$?
fi

exit $status
