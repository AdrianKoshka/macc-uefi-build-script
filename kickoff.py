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

def clone_repos() -> None:
    if args.clone_from_latest_tag:
        print("=Cloning EDK2 from latest tag=")
        subprocess.call("./clone-tag.sh")
    else:
        print("=Cloning EDK2 from master=")
        subprocess.call("./clone.sh")
    
    if args.ecam_patch:
        print("=Applying the PCIe ECAM base address patch=")
        subprocess.call("./ECAM-patch.sh")
    else:
        pass

def edk2_build() -> None:
    print("=Building EDK2=")
    buildProcess = subprocess.run("./build.sh", shell=True, check=True)

def tfa_build() -> None:
    print("=Building TFA=")
    subprocess.run("./tfa.sh", shell=True, check=True)

def main() -> None:
    if args.nuke_everything:
        subprocess.run("./nuke.sh", shell=True, check=True)
    else:
        pass
    if args.just_build:
        pass
    else:
        clone_repos()
    edk2_build()
    tfa_build()

if __name__ == "__main__":
    main()
