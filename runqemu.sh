#!/bin/bash

#  qemu system script for assignment 4
# Author: Linfeng Li
cd ./buildroot
qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1  -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0,hostfwd=tcp::9000-:9000 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0