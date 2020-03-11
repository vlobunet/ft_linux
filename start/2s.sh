#!/bin/bash
#монтируем разделы
mount -v -t ext4 /dev/sdb2 $LFS			|| exit 1
mkdir -pv $LFS/boot						|| exit 1
mount -v -t ext4 /dev/sdb3 $LFS/boot	|| exit 1
/sbin/swapon -v /dev/sdb4				|| exit 1
