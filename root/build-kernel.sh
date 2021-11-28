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
if [ $usage -eq 1 ]; then
	echo "Usage: ./build-kernel {default,base,net,full}"
	exit
fi

# extract tarball and clean
echo "Extracting /sources/linux-5.13.12.tar.xz..."
tar -xf /sources/linux-5.13.12.tar.xz -C /sources
echo "Cleaning source tree..."
pushd /sources/linux-5.13.12
make mrproper
popd

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
if [ $type == "net" ]; then
        echo "Building net kernel..."
	#copy config
	cp /root/kernel-config.net /sources/linux-5.13.12/.config
fi


# full


# build kernel
pushd /sources/linux-5.13.12
make -j4

# install modules
make modules_install

# copy files
cp -v .config /boot/config-5.13.12
cp -v System.map /boot/System.map-5.13.12
cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-5.13.12-lfs-11.0

# cleanup
rm -rf linux-5.13.12
popd
echo "Done."
exit


# END script
#-------------------------------------------------------------------
