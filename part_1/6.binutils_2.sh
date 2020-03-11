#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	# tar -xf $tar_name										|| return
	cd $dir_name											|| return
	mkdir -v build						|| return
	cd build							|| return
}

build(){
	CC=$LFS_TGT-gcc                \
	AR=$LFS_TGT-ar                 \
	RANLIB=$LFS_TGT-ranlib         \
	../configure                   \
	    --prefix=/tools            \
	    --disable-nls              \
	    --disable-werror           \
	    --with-lib-path=/tools/lib \
		--with-sysroot					|| return
	make								|| return
	make install						|| return
	make -C ld clean					|| return
	make -C ld LIB_PATH=/usr/lib:/lib	|| return
	cp -v ld/ld-new /tools/bin			|| return
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
