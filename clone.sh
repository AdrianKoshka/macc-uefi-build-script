#!/usr/bin/env bash
BDIR=e2b
mkdir $BDIR
cd $BDIR

git clone --recurse-submodules https://github.com/tianocore/edk2.git -b edk2-stable202008
git clone https://github.com/tianocore/edk2-non-osi.git -b master
git clone https://github.com/tianocore/edk2-platforms.git -b master
cd edk2-platforms
git checkout 1e09147a01aeb45aa43e36923d96a1d6b0ec9106
cd ..
git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git -b master atf
git clone https://github.com/MarvellEmbeddedProcessors/binaries-marvell.git -b binaries-marvell-armada-18.12 binaries
git clone https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell.git -b mv-ddr-devel mv_ddr

