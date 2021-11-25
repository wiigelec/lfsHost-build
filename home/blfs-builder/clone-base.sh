#!/bin/bash

#-------------------------------------------------------------------
# clone base

# clear scripts directory
rm -r ./blfs_root/scripts

# build base
cp -r ./blfs_root/scripts.base ./blfs_root/scripts
pushd ./blfs_root/work
../gen-makefile.sh
make
popd

# END script
#-------------------------------------------------------------------
