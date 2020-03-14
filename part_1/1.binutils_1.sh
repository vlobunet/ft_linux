#!/bin/sh

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	pushd $dir_name											|| return
	mkdir -v build											|| return
	pushd build												|| return
}

build(){
	../configure --prefix=/tools \
		--with-sysroot=$LFS \
		--with-lib-path=/tools/lib \
		--target=$LFS_TGT \
		--disable-nls \
		--disable-werror									|| return
	make													|| return
	mkdir -v /tools/lib && ln -sv lib /tools/lib64
	make install											|| return
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