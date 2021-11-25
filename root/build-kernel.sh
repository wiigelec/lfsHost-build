#!/bin/bash

#-------------------------------------------------------------------
# Build kernel default base net full

# Get parameter
type=$1

case $type in

    default)
	    echo "Building default kernel..."
	    tar -xf /mnt/lfs/sources/linux-5.13.12.tar.xz -C
	    /mnt/lfs/sources
	    pushd /mnt/lfs/sources/linux-5.13.12.tar.xz
	    make defconfig
	    make -j4
	    cp .config /boot/config-5.13.12
	    cp System.map /boot/config/System.map-5.13.12
	    cp arch/x86_64/bzImage /boot/vmlinuz-5.13.12-lfs-11.0
	    rm -rf linux-5.13.12
	    popd
	    echo "Done."
	    exit
	;;
    base)
	;;
    net)
	;;
    full)
	;;
    *)
	echo "Usage: ./build-kernel {default,base,net,full}"
	;;
esac








# END script
#-------------------------------------------------------------------