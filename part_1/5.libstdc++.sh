#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
	mkdir -v build											|| return
	cd build												|| return
}

build(){
	../libstdc++-v3/configure           \
		--host=$LFS_TGT                 \
		--prefix=/tools                 \
		--disable-multilib              \
		--disable-nls                   \
		--disable-libstdcxx-threads     \
		--disable-libstdcxx-pch         \
		--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/9.2.0	|| return
	make															|| return
	make install													|| return
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
