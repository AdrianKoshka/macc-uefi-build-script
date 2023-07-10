#!/usr/bin/env bash
BDIR=e2b
mkdir $BDIR
cd $BDIR

git clone --depth=1 --recurse-submodules https://github.com/tianocore/edk2.git -b edk2-stable202305
git clone --depth=1 https://github.com/tianocore/edk2-non-osi.git -b master
git clone --depth=1 https://github.com/tianocore/edk2-platforms.git -b master
git clone --depth=1 https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git -b master
cd trusted-firmware-a
cp ../../tfa.patch tfa.patch
git apply tfa.patch
cd ..
git clone --depth=1 https://github.com/MarvellEmbeddedProcessors/binaries-marvell.git -b binaries-marvell-armada-SDK10.0.1.0 binaries
git clone --depth=1 https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell.git -b master