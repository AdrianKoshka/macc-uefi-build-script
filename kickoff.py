#!/usr/bin/env python3
import argparse
import subprocess

parser = argparse.ArgumentParser(description='Kick off the UEFI clone and build process')
parser.add_argument("-e", "--ecam-patch", action='store_true', dest="ecam_patch",
                    help="Include the PCI ECAM base address patch")
parser.add_argument("-t", "--clone-from-latest-tag", action='store_true', dest="clone_from_latest_tag",
                    help="Clone from the latest EDK2 tag")
parser.add_argument("-n", "--nuke", action='store_true', dest="nuke_everything",
                    help="Nuke the directory which containes the git and build directories")
parser.add_argument("-jb", "--just-build", action='store_true', dest='just_build',
                    help="Just build EDK2, don't clone repos")

args = parser.parse_args()

def clone_repos():
    if args.clone_from_latest_tag:
        print("============================\nCloning EDK2 from latest tag\n============================")
        subprocess.call("./clone-tag.sh")
    else:
        print("========================\nCloning EDK2 from master\n========================")
        subprocess.call("./clone.sh")
    
    if args.ecam_patch:
        print("=========================================\nApplying the PCIe ECAM base address patch\n=========================================")
        subprocess.call("./ECAM-patch.sh")
    else:
        pass

def edk2_build():
    print("=============\nBuilding EDK2\n=============")
    subprocess.call("./build.sh")

def tfa_build():
    print("============\nBuilding TFA\n============")
    subprocess.call("./tfa.sh")

def main():
    if args.nuke_everything:
        subprocess.call("./nuke.sh")
    elif args.just_build:
        edk2_build()
        tfa_build()
    else:
        clone_repos()
        edk2_build()
        tfa_build()

if __name__ == "__main__":
    main()
