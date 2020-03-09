#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
}

build(){
	cd gettext-tools										|| return
	EMACS="no" ./configure --prefix=/tools --disable-shared	|| return
	make -C gnulib-lib										|| return
	make -C intl pluralx.c									|| return
	make -C src msgfmt										|| return
	make -C src msgmerge									|| return
	make -C src xgettext									|| return
	cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin			|| return
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
