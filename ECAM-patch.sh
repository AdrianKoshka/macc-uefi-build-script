#!/usr/bin/env bash
BDIR=e2b
cd $BDIR

cd edk2-platforms
cp ../../pcie.h.patch pcie.h.patch
git apply pcie.h.patch
cd ..