#!/bin/bash

apt upgrade && apt update && apt-get install -y vim git gcc gparted texinfo bison gawk m4 nano libgl-dev libglu-dev

export LFS=/mnt/lfs && echo $LFS
#2.7. Mounting the New Partition
mkdir -pv $LFS	|| exit 1
mount -v -t ext4 /dev/sdb2 $LFS	|| exit 2
mkdir -pv $LFS/boot	|| exit 3
mount -v -t ext4 /dev/sdb3 $LFS/boot	|| exit 4
/sbin/swapon -v /dev/sdb4	|| exit 5
#3.1. Introduction
mkdir -pv $LFS/sources		|| exit 6
chmod -v a+wt $LFS/sources	|| exit 7
wget -q --input-file=http://www.linuxfromscratch.org/lfs/view/development/wget-list --continue --directory-prefix=$LFS/sources
wget -q --input-file=$LFS/sources/wget-list --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
wget -q --input-file=http://www.linuxfromscratch.org/lfs/view/development/md5sums --continue --directory-prefix=$LFS/sources
md5sum -c md5sums
popd
#4.2. Creating the $LFS/tools Directory
mkdir -v $LFS/tools			|| exit 8
ln -sv $LFS/tools /			|| exit 9
#4.3. Adding the LFS User
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
chown -v lfs $LFS/sources
su - lfs