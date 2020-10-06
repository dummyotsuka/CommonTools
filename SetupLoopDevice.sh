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


# 次を/root/.bashrcに書く
function SetupLoopDevice() { if losetup | grep /dev/loop$1; then echo "/dev/loop$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/disk$1.img bs=1024 count=300000; losetup /dev/loop$1 /root/disk$1.img; echo "/dev/loop$1を再構築しました"; fi; }
