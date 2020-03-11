#!/bin/bash

tar_name=$1
dir_name=$2
status=0

setup(){
	tar -xf $tar_name										|| return
	cd $dir_name											|| return
	tar -xf ../mpfr-4.0.2.tar.xz							|| return
	mv -v mpfr-4.0.2 mpfr									|| return
	tar -xf ../gmp-6.2.0.tar.xz								|| return
	mv -v gmp-6.2.0 gmp										|| return
	tar -xf ../mpc-1.1.0.tar.gz								|| return
	mv -v mpc-1.1.0 mpc										|| return

	for file in $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
	do
		printf "[$file]\n"
		cp -uv $file{,.orig}								|| return
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g'	\
			-e 's@/usr@/tools@g' $file.orig > $file			|| return
		echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file			|| return
		touch $file.orig									|| return
	done

	sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64

	mkdir -v build											|| return
	cd build												|| return
}

build(){
	../configure                                       \
	    --target=$LFS_TGT                              \
	    --prefix=/tools                                \
	    --with-glibc-version=2.11                      \
	    --with-sysroot=$LFS                            \
	    --with-newlib                                  \
	    --without-headers                              \
	    --with-local-prefix=/tools                     \
	    --with-native-system-header-dir=/tools/include \
	    --disable-nls                                  \
	    --disable-shared                               \
	    --disable-multilib                             \
	    --disable-decimal-float                        \
	    --disable-threads                              \
	    --disable-libatomic                            \
	    --disable-libgomp                              \
	    --disable-libmpx                               \
	    --disable-libquadmath                          \
	    --disable-libssp                               \
	    --disable-libvtv                               \
	    --disable-libstdcxx                            \
		--enable-languages=c,c++							|| return
	make													|| return
	make install											|| return
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
