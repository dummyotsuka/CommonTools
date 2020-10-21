#!/bin/sh

# dd if=/dev/zero of=disk11.img bs=1024 count=300000
# losetup /dev/loop11 /root/disk11.img
# fdisk /dev/loop11
# partprobe /dev/loop11

# if losetup | grep /dev/loop11; then echo ok; else echo ng; fi

# This is the answer.
# if losetup | grep /dev/loop12; then echo /dev/loop12のディスクは研修用に準備済みです; else dd if=/dev/zero of=disk12.img bs=1024 count=300000; losetup /dev/loop12 /root/disk12.img; echo /dev/loop12を再構築しました; fi

# function SetupLoopDevice() { if losetup | grep /dev/loop12; then echo /dev/loop12のディスクは研修用に準備済みです; else dd if=/dev/zero of=disk12.img bs=1024 count=300000; losetup /dev/loop12 /root/disk12.img; echo /dev/loop12を再構築しました; fi; }

# function SetupLoopDevice3() { echo $1 ; if losetup | grep /dev/loop$1; then echo "/dev/loop$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/disk$1.img bs=1024 count=300000; losetup /dev/loop$1 /root/disk$1.img; echo "/dev/loop$1を再構築しました"; fi; }

#function SetupLoopDevice() { if losetup | grep /dev/loop$1$ ; then echo "/dev/loop$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/disk$1.img bs=1024 count=300000; losetup /dev/loop$1 /root/disk$1.img; echo "/dev/loop$1を再構築しました"; fi; }
# function SetupLoopDevice() { if losetup | grep /dev/loop$1$ ; then echo "/dev/loop$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/disk$1.img bs=1024 count=300000; losetup /dev/loop$1 /root/disk$1.img; echo "/dev/loop$1を再構築しました"; fi; if mount | grep /root/disk$1.img; then umount /dev/loop$1; losetup /dev/loop$1 /root/disk$1.img; fi; }


# 次を/root/.bashrcに書く
function SetupDisk() { if ls "/root/vdisk$1" ; then echo "/dev/vdisk$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/vdisk$1 bs=1024 count=300000; echo "/root/vdisk$1を再構築しました"; fi; }


# 使い方
SetupDisk 1



# for zero linux
SetupDisk 0

if mount | grep /root/vdisk0
then echo "";
else mkfs.ext4 /root/vdisk0 << A
y
A
mount /root/vdisk0 /mnt/mountdir
fi
