#!/usr/bin/env bash
BDIR=e2b

cd ${BDIR}
export PYTHON_COMMAND=/usr/bin/python3.8
export export WORKSPACE=$PWD
export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD/edk2-non-osi
make -C edk2/BaseTools
source edk2/edksetup.sh
build \
	-a AARCH64 \
	-b RELEASE \
	-t GCC5 \
	-p Platform/SolidRun/Armada80x0McBin/Armada80x0McBin.dsc \
	-D X64EMU_ENABLE \
	-D IP6_ENABLE \
	-D NETWORK_TLS_ENABLE \
	-D NETWORK_HTTP_BOOT_ENABLE \
	-D NETWORK_ALLOW_HTTP_CONNECTIONS \
	-D NETWORK_ISCSI_ENABLE

ls Build/Armada80x0McBin-AARCH64/RELEASE_GCC5/FV/ARMADA_EFI.fd
