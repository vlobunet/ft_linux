#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
}

build(){
	make -f Makefile-libbz2_so
	make clean
	make						|| return
	make PREFIX=/tools install	|| return
	cp -v bzip2-shared /tools/bin/bzip2 || return
	cp -av libbz2.so* /tools/lib || return 
	ln -sv libbz2.so.1.0 /tools/lib/libbz2.so || return
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