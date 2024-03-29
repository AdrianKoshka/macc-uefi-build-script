#!/usr/bin/env bash
BDIR=e2b

cd ${BDIR}
export WORKSPACE=$PWD
export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD/edk2-non-osi

make -C trusted-firmware-a \
        PLAT=a80x0_mcbin \
        MV_DDR_PATH=$PWD/mv-ddr-marvell \
        SCP_BL2=$PWD/binaries/mrvl_scp_bl2.img \
        BL33=$PWD/Build/Armada80x0McBin-AARCH64/RELEASE_GCC5/FV/ARMADA_EFI.fd \
        all fip mrvl_flash

cp trusted-firmware-a/build/a80x0_mcbin/release/flash-image.bin uefi-mcbin-spi.bin