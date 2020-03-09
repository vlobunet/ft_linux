#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return

	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
}

build(){
	./configure --prefix=/tools --without-guile	|| return
	make										|| return
	make install								|| return
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
