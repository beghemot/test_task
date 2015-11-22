#!/usr/bin/env bash
echo "Creating partition"
parted -s /dev/sdb mklabel gpt
parted -s /dev/sdb mkpart primary ext4 0 2147
echo "Creating FS"
mkfs.ext4 /dev/sdb1
echo "Creating dir for mount point"
mkdir /data
echo "Mounting partition"
mount -t ext4 /dev/sdb1 /data
echo "Adding to /etc/fstab"
echo "/dev/sdb1 /data ext4 defaults 1 2" >> /etc/fstab
