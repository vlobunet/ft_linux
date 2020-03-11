#!/bin/sh

PWD=$LFS/sources

cp -v * $PWD
pushd $PWD

wget -q --show-progress	http://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz --continue --directory-prefix=$LFS/sources
printf "[1.binutils_1.sh binutils-2.34.tar.xz binutils-2.34]: "
bash 1.binutils_1.sh binutils-2.34.tar.xz binutils-2.34
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.xz --continue --directory-prefix=$LFS/sources
wget -q --show-progress	http://www.mpfr.org/mpfr-4.0.2/mpfr-4.0.2.tar.xz --continue --directory-prefix=$LFS/sources
wget -q --show-progress	http://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.xz --continue --directory-prefix=$LFS/sources
wget -q --show-progress	https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz --continue --directory-prefix=$LFS/sources
printf "[2.gcc_1.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 2.gcc_1.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.5.3.tar.xz --continue --directory-prefix=$LFS/sources
printf "[3.linux.sh linux-5.5.3.tar.xz linux-5.5.3]: "
bash 3.linux.sh linux-5.5.3.tar.xz linux-5.5.3
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/glibc/glibc-2.31.tar.xz --continue --directory-prefix=$LFS/sources
printf "[4.glibc.sh glibc-2.31.tar.xz glibc-2.31]: "
bash 4.glibc.sh glibc-2.31.tar.xz glibc-2.31
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi


printf "[5.libstdc++.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 5.libstdc.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

printf "[6.binutils_2.sh binutils-2.34.tar.xz binutils-2.34]: "
bash 6.binutils_2.sh binutils-2.34.tar.xz binutils-2.34
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

printf "[7.gcc_2.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 7.gcc_2.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://downloads.sourceforge.net/tcl/tcl8.6.10-src.tar.gz --continue --directory-prefix=$LFS/sources
printf "[8.tcl8.sh tcl8.6.10-src.tar.gz tcl8.6.10-src]: "
bash 8.tcl8.sh tcl8.6.10-src.tar.gz tcl8.6.10-src
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz --continue --directory-prefix=$LFS/sources
printf "[9.expect5.sh expect5.45.4.tar.gz expect5.45.4]: "
bash 9.expect5.sh expect5.45.4.tar.gz expect5.45.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.2.tar.gz --continue --directory-prefix=$LFS/sources
printf "[10.dejagnu.sh dejagnu-1.6.2.tar.gz dejagnu-1.6.2]: "
bash 10.dejagnu.sh dejagnu-1.6.2.tar.gz dejagnu-1.6.2 
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz --continue --directory-prefix=$LFS/sources
printf "[11.m4.sh m4-1.4.18.tar.xz m4-1.4.18]: "
bash 11.m4.sh m4-1.4.18.tar.xz m4-1.4.18
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz --continue --directory-prefix=$LFS/sources
printf "[12.ncurses.sh ncurses-6.2.tar.gz ncurses-6.2]: "
bash 12.ncurses.sh ncurses-6.2.tar.gz ncurses-6.2
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/bash/bash-5.0.tar.gz --continue --directory-prefix=$LFS/sources
printf "[13.bash.sh bash-5.0.tar.gz bash-5.0]: "
bash 13.bash.sh bash-5.0.tar.gz bash-5.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/bison/bison-3.5.2.tar.xz --continue --directory-prefix=$LFS/sources
printf "[14.bison.sh bison-3.5.2.tar.xz bison-3.5.2]: "
bash 14.bison.sh bison-3.5.2.tar.xz bison-3.5.2
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz --continue --directory-prefix=$LFS/sources
printf "[15.bzip2.sh bzip2-1.0.8.tar.gz bzip2-1.0.8]: "
bash 15.bzip2.sh bzip2-1.0.8.tar.gz bzip2-1.0.8
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz --continue --directory-prefix=$LFS/sources
printf "[16.coreutils.sh coreutils-8.31.tar.xz coreutils-8.31]: "
bash 16.coreutils.sh coreutils-8.31.tar.xz coreutils-8.31
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz --continue --directory-prefix=$LFS/sources
printf "[17.diffutils.sh diffutils-3.7.tar.xz diffutils-3.7]: "
bash 17.diffutils.sh diffutils-3.7.tar.xz diffutils-3.7
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	 ftp://ftp.astron.com/pub/file/file-5.38.tar.gz --continue --directory-prefix=$LFS/sources
printf "[18.file.sh file-5.38.tar.gz file-5.38]: "
bash 18.file.sh file-5.38.tar.gz file-5.38
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/findutils/findutils-4.7.0.tar.xz --continue --directory-prefix=$LFS/sources
printf "[19.findutils.sh findutils-4.7.0.tar.xz findutils-4.7.0]: "
bash 19.findutils.sh findutils-4.7.0.tar.xz findutils-4.7.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz --continue --directory-prefix=$LFS/sources
printf "[20.gawk.sh gawk-5.0.1.tar.xz gawk-5.0.1]: "
bash 20.gawk.sh gawk-5.0.1.tar.xz gawk-5.0.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/gettext/gettext-0.20.1.tar.xz --continue --directory-prefix=$LFS/sources
printf "[21.gettext.sh gettext-0.20.1.tar.xz gettext-0.20.1]: "
bash 21.gettext.sh gettext-0.20.1.tar.xz gettext-0.20.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi
	
wget -q --show-progress	http://ftp.gnu.org/gnu/grep/grep-3.4.tar.xz --continue --directory-prefix=$LFS/sources
printf "[21.grep.sh grep-3.4.tar.xz grep-3.4]: "
bash 21.grep.sh grep-3.4.tar.xz grep-3.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz --continue --directory-prefix=$LFS/sources
printf "[22.gzip.sh gzip-1.10.tar.xz gzip-1.10]: "
bash 22.gzip.sh gzip-1.10.tar.xz gzip-1.10
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/make/make-4.3.tar.gz --continue --directory-prefix=$LFS/sources
printf "[23.make.sh make-4.3.tar.gz make-4.3]: "
bash 23.make.sh make-4.3.tar.gz make-4.3
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz --continue --directory-prefix=$LFS/sources
printf "[24.patch.sh patch-2.7.6.tar.xz patch-2.7.6]: "
bash 24.patch.sh patch-2.7.6.tar.xz patch-2.7.6
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://www.cpan.org/src/5.0/perl-5.30.1.tar.xz --continue --directory-prefix=$LFS/sources
printf "[25.perl.sh perl-5.30.1.tar.xz perl-5.30.1]: "
bash 25.perl.sh perl-5.30.1.tar.xz perl-5.30.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tar.xz --continue --directory-prefix=$LFS/sources
printf "[26.Python.sh Python-3.8.1.tar.xz Python-3.8.1]: "
bash 26.Python.sh Python-3.8.1.tar.xz Python-3.8.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz --continue --directory-prefix=$LFS/sources
printf "[27.sed.sh sed-4.8.tar.xz sed-4.8]: "
bash 27.sed.sh sed-4.8.tar.xz sed-4.8
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/tar/tar-1.32.tar.xz --continue --directory-prefix=$LFS/sources
printf "[28.tar.sh tar-1.32.tar.xz tar-1.32]: "
bash 27.tar.sh tar-1.32.tar.xz tar-1.32
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	http://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz --continue --directory-prefix=$LFS/sources
printf "[29.texinfo.sh texinfo-6.7.tar.xz texinfo-6.7]: "
bash 29.texinfo.sh texinfo-6.7.tar.xz texinfo-6.7
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

wget -q --show-progress	https://tukaani.org/xz/xz-5.2.4.tar.xz --continue --directory-prefix=$LFS/sources
printf "[30.xz.sh xz-5.2.4.tar.xz xz-5.2.4]: "
bash 30.xz.sh xz-5.2.4.tar.xz xz-5.2.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32m ✓✓✓\033[0m\n"
else
	printf "\033[31m ✗✗✗\033[0m\n"
	exit $status
fi

printf "\033[32m========================== PART1 : OK ================================\033[0m\n"
