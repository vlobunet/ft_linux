#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
}

build(){
	cp -v configure{,.orig}	.									|| return
	sed 's:/usr/local/bin:/bin:' configure.orig > configure		|| return
	./configure --prefix=/tools			\
		--with-tcl=/tools/lib			\
		--with-tclinclude=/tools/include						|| return
	make														|| return
	make SCRIPTS="" install										|| return
}

# teardown(){
# 	cd $LFS/sources
# 	rm -rfv $dir_name
# }

# Internal process

if [ $status -eq 0 ]; then
	setup >> $LFS/sources/$dir_name.log 2>&1
	status=$?
fi

if [ $status -eq 0 ]; then
	build >> $LFS/sources/$dir_name.log 2>&1
	status=$?
fi

# if [ $status -eq 0 ]; then
# 	teardown >> $LFS/sources/$dir_name.log 2>&1
# 	status=$?
# fi

exit $status
