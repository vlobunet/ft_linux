#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return

	cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
		`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h	|| return
	
	for file in gcc/config/{linux,i386/linux{,64}}.h
	do
		cp -uv $file{,.orig}
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' -e \
		's@/usr@/tools@g' $file.orig > $file
		echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
		touch $file.orig
	done

	sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64

	tar -xf ../mpfr-4.0.2.tar.xz						|| return
	mv -v mpfr-4.0.2 mpfr								|| return
	tar -xf ../gmp-6.2.0.tar.xz							|| return
	mv -v gmp-6.2.0 gmp									|| return
	tar -xf ../mpc-1.1.0.tar.gz							|| return
	mv -v mpc-1.1.0 mpc									|| return

	sed -e '1161 s|^|//|' \
    -i libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc

	mkdir -v build										|| return
	cd build											|| return
}

build(){
	CC=$LFS_TGT-gcc                                    \
	CXX=$LFS_TGT-g++                                   \
	AR=$LFS_TGT-ar                                     \
	RANLIB=$LFS_TGT-ranlib                             \
	../configure                                       \
		--prefix=/tools                                \
		--with-local-prefix=/tools                     \
		--with-native-system-header-dir=/tools/include \
		--enable-languages=c,c++                       \
		--disable-libstdcxx-pch                        \
		--disable-multilib                             \
		--disable-bootstrap                            \
		--disable-libgomp								|| return

	make												|| return
	make install										|| return
	ln -sv gcc /tools/bin/cc							|| return
}

test(){
	echo 'int main(){}' > dummy.c
	cc dummy.c											|| return
	readelf -l a.out | grep ': /tools'					|| return
	rm -v dummy.c a.out									|| return
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
