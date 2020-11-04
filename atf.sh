#!/usr/bin/env bash
BDIR=e2b

cd ${BDIR}
export PYTHON_COMMAND=/usr/bin/python3.8
export export WORKSPACE=$PWD
export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD/edk2-non-osi

make -C atf \
        PLAT=a80x0_mcbin \
        MV_DDR_PATH=$PWD/mv_ddr \
        SCP_BL2=$PWD/binaries/mrvl_scp_bl2.img \
        BL33=$PWD/Build/Armada80x0McBin-AARCH64/RELEASE_GCC5/FV/ARMADA_EFI.fd \
        all fip

cp atf/build/a80x0_mcbin/release/fip.bin uefi-mcbin-spi.bin
