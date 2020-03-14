#!/bin/sh

printf "[1.binutils_1.sh binutils-2.34.tar.xz binutils-2.34]: "
bash 1.binutils_1.sh binutils-2.34.tar.xz binutils-2.34
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[2.gcc_1.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 2.gcc_1.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[3.linux.sh linux-5.5.7.tar.xz linux-5.5.7]: "
bash 3.linux.sh linux-5.5.7.tar.xz linux-5.5.7
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[4.glibc.sh glibc-2.31.tar.xz glibc-2.31]: "
bash 4.glibc.sh glibc-2.31.tar.xz glibc-2.31
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi


printf "[5.libstdc++.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 5.libstdc++.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[6.binutils_2.sh binutils-2.34.tar.xz binutils-2.34]: "
bash 6.binutils_2.sh binutils-2.34.tar.xz binutils-2.34
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[7.gcc_2.sh gcc-9.2.0.tar.xz gcc-9.2.0]: "
bash 7.gcc_2.sh gcc-9.2.0.tar.xz gcc-9.2.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[8.tcl8.sh tcl8.6.10-src.tar.gz tcl8.6.10-src]: "
bash 8.tcl8.sh tcl8.6.10-src.tar.gz tcl8.6.10-src
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[9.expect5.sh expect5.45.4.tar.gz expect5.45.4]: "
bash 9.expect5.sh expect5.45.4.tar.gz expect5.45.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[10.dejagnu.sh dejagnu-1.6.2.tar.gz dejagnu-1.6.2]: "
bash 10.dejagnu.sh dejagnu-1.6.2.tar.gz dejagnu-1.6.2 
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[11.m4.sh m4-1.4.18.tar.xz m4-1.4.18]: "
bash 11.m4.sh m4-1.4.18.tar.xz m4-1.4.18
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[12.ncurses.sh ncurses-6.2.tar.gz ncurses-6.2]: "
bash 12.ncurses.sh ncurses-6.2.tar.gz ncurses-6.2
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[13.bash.sh bash-5.0.tar.gz bash-5.0]: "
bash 13.bash.sh bash-5.0.tar.gz bash-5.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[14.bison.sh bison-3.5.2.tar.xz bison-3.5.2]: "
bash 14.bison.sh bison-3.5.2.tar.xz bison-3.5.2
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[15.bzip2.sh bzip2-1.0.8.tar.gz bzip2-1.0.8]: "
bash 15.bzip2.sh bzip2-1.0.8.tar.gz bzip2-1.0.8
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[16.coreutils.sh coreutils-8.31.tar.xz coreutils-8.31]: "
bash 16.coreutils.sh coreutils-8.31.tar.xz coreutils-8.31
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[17.diffutils.sh diffutils-3.7.tar.xz diffutils-3.7]: "
bash 17.diffutils.sh diffutils-3.7.tar.xz diffutils-3.7
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[18.file.sh file-5.38.tar.gz file-5.38]: "
bash 18.file.sh file-5.38.tar.gz file-5.38
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[19.findutils.sh findutils-4.7.0.tar.xz findutils-4.7.0]: "
bash 19.findutils.sh findutils-4.7.0.tar.xz findutils-4.7.0
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[20.gawk.sh gawk-5.0.1.tar.xz gawk-5.0.1]: "
bash 20.gawk.sh gawk-5.0.1.tar.xz gawk-5.0.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[21.gettext.sh gettext-0.20.1.tar.xz gettext-0.20.1]: "
bash 21.gettext.sh gettext-0.20.1.tar.xz gettext-0.20.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi
	
printf "[22.grep.sh grep-3.4.tar.xz grep-3.4]: "
bash 22.grep.sh grep-3.4.tar.xz grep-3.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[23.gzip.sh gzip-1.10.tar.xz gzip-1.10]: "
bash 23.gzip.sh gzip-1.10.tar.xz gzip-1.10
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[24.make.sh make-4.3.tar.gz make-4.3]: "
bash 24.make.sh make-4.3.tar.gz make-4.3
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[25.patch.sh patch-2.7.6.tar.xz patch-2.7.6]: "
bash 25.patch.sh patch-2.7.6.tar.xz patch-2.7.6
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[26.perl.sh perl-5.30.1.tar.xz perl-5.30.1]: "
bash 26.perl.sh perl-5.30.1.tar.xz perl-5.30.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[27.Python.sh Python-3.8.1.tar.xz Python-3.8.1]: "
bash 27.Python.sh Python-3.8.1.tar.xz Python-3.8.1
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[28.sed.sh sed-4.8.tar.xz sed-4.8]: "
bash 28.sed.sh sed-4.8.tar.xz sed-4.8
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[29.tar.sh tar-1.32.tar.xz tar-1.32]: "
bash 29.tar.sh tar-1.32.tar.xz tar-1.32
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[30.texinfo.sh texinfo-6.7.tar.xz texinfo-6.7]: "
bash 30.texinfo.sh texinfo-6.7.tar.xz texinfo-6.7
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[31.xz.sh xz-5.2.4.tar.xz xz-5.2.4]: "
bash 31.xz.sh xz-5.2.4.tar.xz xz-5.2.4
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "[stripping.sh]:"
bash stripping.sh
status=$?
if [ $status -eq 0 ]; then	
	printf "\033[32mOK\033[0m\n"
else
	printf "\033[31mKO\033[0m\n"
	exit $status
fi

printf "\033[32m========================== PART1 : OK ================================\033[0m\n"
