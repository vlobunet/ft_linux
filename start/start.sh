apt upgrade && apt update && apt-get install -y vim git gcc gparted texinfo bison gawk m4 nano libgl-dev libglu-dev
export LFS=/mnt/lfs && echo $LFS
mkdir -pv $LFS							|| exit 1

#монтируем разделы
mount -v -t ext4 /dev/sdb2 $LFS			|| exit 1
mkdir -pv $LFS/boot						|| exit 1
mount -v -t ext4 /dev/sdb3 $LFS/boot	|| exit 1
/sbin/swapon -v /dev/sdb4				|| exit 1

# создаем ресурсные и временные директории
mkdir -pv $LFS/sources		|| exit 1
chmod -v a+wt $LFS/sources	|| exit 1
mkdir -v $LFS/tools					|| exit 1
ln -sv $LFS/tools /					|| exit 1

# создаем юзера и передаем ему управление
groupadd lfs										|| exit 1
useradd -s /bin/bash -g lfs -m -k /dev/null lfs		|| exit 1
passwd lfs
chown -v lfs $LFS/tools								|| exit 1
chown -v lfs $LFS/sources
su - lfs

# устанавливаем переменные окружения для нового юзера
echo "
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
" > ~/.bash_profile
echo "
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
" > ~/.bashrc
source ~/.bash_profile

printf "\033[36[m[{✓}]\033[0m\n"
printf "\033[36[m[Теперь нужно перейти к пользователю root и експортировать]\033[0m\n"
printf "\033[36[m[]\033[0m\n"

printf "\033[36[m[export LFS=/mnt/lfs]\033[0m\n"
printf "\033[36[m[export LC_ALL=POSIX]\033[0m\n"
printf "\033[36[m[export LFS_TGT=$(uname -m)-lfs-linux-gnu]\033[0m\n"
printf "\033[36[m[export PATH=/tools/bin:/bin:/usr/bin]\033[0m\n"