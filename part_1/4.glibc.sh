#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name				|| return
	cd $dir_name					|| return
	mkdir -v build					|| return
	cd build						|| return
}

build(){
	../configure                         \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=/tools/include			|| return

	make									|| return
	make install							|| return
}

test(){
	echo 'int main(){}' > dummy.c
	$LFS_TGT-gcc dummy.c
	readelf -l a.out | grep ': /tools'
	rm -v dummy.c a.out
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
