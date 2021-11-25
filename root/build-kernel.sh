#!/bin/bash

#-------------------------------------------------------------------
# Build kernel default base net full

# Get parameter
type=$1

# usage
usage=1;
case $type in

    default)
	    usage=0
	    ;;
    base)
	    usage=0
	    ;;
    net)
	    usage=0
	    ;;
    full)
	    usage=0
	    ;;
    *)
	    usage=1
	    ;;
esac

# wrong parameters
if [ usage ]; then
	echo "Usage: ./build-kernel {default,base,net,full}"
	exit
fi

# extract tarball
echo "Extracting /sources/linux-5.13.12.tar.xz..."
tar -xf /sources/linux-5.13.12.tar.xz -C /sources

# default
if [ $type == "default" ]; then
	echo "Building default kernel..."
	pushd /sources/linux-5.13.12
	make defconfig
	popd
fi

# base
if [ $type == "base" ]; then
        echo "Building base kernel..."
	#copy config
	cp /root/kernel-config.base /sources/linux-5.13.12/.config
fi

# net

# full


# build kernel
pushd /sources/linux-5.13.12
make -j4

# install modules
make modules_install

# copy files
cp .config /boot/config-5.13.12
cp System.map /boot/config/System.map-5.13.12
cp arch/x86_64/bzImage /boot/vmlinuz-5.13.12-lfs-11.0

# cleanup
rm -rf linux-5.13.12
popd
echo "Done."
exit


# END script
#-------------------------------------------------------------------
