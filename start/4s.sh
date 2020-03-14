#!/bin/bash
#4.4. Setting Up the Environment

echo > ~/.bash_profile "
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash"

echo > ~/.bashrc "
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH"

source ~/.bash_profile