#!~/.dotnet/tools/pwsh
$BDIR="e2b"
New-Item -ItemType Directory $BDIR
Set-Location $BDIR

$RepoArgs = @(
    ("git clone --recurse-submodules https://github.com/tianocore/edk2.git -b edk2-stable202011"),
    ("git clone https://github.com/tianocore/edk2-non-osi.git -b master"),
    ("git clone https://github.com/tianocore/edk2-platforms.git -b master"),
    ("git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git -b master"),
    ("git clone https://github.com/MarvellEmbeddedProcessors/binaries-marvell.git -b binaries-marvell-armada-18.12 binaries"),
    ("git clone https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell.git -b mv-ddr-devel")
)

$RepoArgs | ForEach-Object -Parallel {
    Invoke-Expression -Command $_
}