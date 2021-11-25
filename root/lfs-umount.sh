#!/bin/bash

#-------------------------------------------------------------------
# unmount lfs

echo "Unmounting lfs kernfs..."

umount /mnt/lfs/dev/pts
umount /mnt/lfs/dev
umount /mnt/lfs/proc
umount /mnt/lfs/run
umount /mnt/lfs/sys

findmnt

echo "Done."

# END script
#-------------------------------------------------------------------
