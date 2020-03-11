#!/bin/bash
# создаем юзера и передаем ему управление
groupadd lfs										|| exit 1
useradd -s /bin/bash -g lfs -m -k /dev/null lfs		|| exit 1
passwd lfs
chown -v lfs $LFS/tools								|| exit 1
chown -v lfs $LFS/sources
su - lfs
