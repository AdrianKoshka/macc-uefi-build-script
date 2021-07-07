#!/usr/bin/env bash
BDIR=e2b

cd ${BDIR}
export export WORKSPACE=$PWD
export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD/edk2-non-osi
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

make -C trusted-firmware-a \
        USE_COHERENT_MEM=0 \
        LOG_LEVEL=20 \
        PLAT=a80x0_mcbin \
        MV_DDR_PATH=$PWD/mv-ddr-marvell \
        SCP_BL2=$PWD/binaries/mrvl_scp_bl2.img \
        BL33=$PWD/Build/Armada80x0McBin-AARCH64/RELEASE_GCC5/FV/ARMADA_EFI.fd \
        all fip mrvl_flash

ls -l trusted-firmware-a/build/a80x0_mcbin/release/flash-image.bin
