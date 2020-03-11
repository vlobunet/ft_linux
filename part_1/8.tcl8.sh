#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
	cd unix							|| return
}

build(){
	./configure --prefix=/tools				|| return

	make									|| return

	printf "\n================================= TEST =====================\n"
	TZ=UTC
	make test
	printf "\n============================================================\n"
	make install							|| return
	chmod -v u+w /tools/lib/libtcl8.6.so	|| return
	make install-private-headers			|| return
	ln -sv tclsh8.6 /tools/bin/tclsh		|| return
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
