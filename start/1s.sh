apt upgrade && apt update && apt-get install -y vim git gcc gparted texinfo bison gawk m4 nano libgl-dev libglu-dev
export LFS=/mnt/lfs && echo $LFS
mkdir -pv $LFS							|| exit 1

