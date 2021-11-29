#!/bin/bash

#-------------------------------------------------------------------
# get lfsHost-build

# Extract tar if we have it
tar_file="/usr/src/lfsHost-build-11v0.0a.tar.gz"
if [ -f $tar_file ]; then
	echo "Extracting lfshostsrc.tar..."
	tar -xf $tar_file -C /mnt/lfs
	echo "Done."
	exit
fi








# END script
#-------------------------------------------------------------------
