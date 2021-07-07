#!/usr/bin/env bash
BDIR=e2b
mkdir $BDIR
cd $BDIR

git clone --recurse-submodules https://github.com/tianocore/edk2.git -b edk2-stable202105
git clone https://github.com/tianocore/edk2-non-osi.git -b master
git clone https://github.com/tianocore/edk2-platforms.git -b master
git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git -b master
cd trusted-firmware-a
cp ../../tfa.patch tfa.patch
git apply tfa.patch
cd ..
git clone https://github.com/MarvellEmbeddedProcessors/binaries-marvell.git -b binaries-marvell-armada-SDK10.0.1.0 binaries
git clone https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell.git -b mv-ddr-devel
