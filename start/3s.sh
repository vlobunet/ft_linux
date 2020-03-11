#!/bin/bash
# создаем ресурсные и временные директории
mkdir -pv $LFS/sources		|| exit 1
chmod -v a+wt $LFS/sources	|| exit 1
mkdir -v $LFS/tools					|| exit 1
ln -sv $LFS/tools /					|| exit 1
