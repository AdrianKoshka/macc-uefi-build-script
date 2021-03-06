# Macchiatobin UEFI Build Scripts

## CI Status

[![Build UEFI](https://github.com/AdrianKoshka/macc-uefi-build-script/actions/workflows/build.yml/badge.svg)](https://github.com/AdrianKoshka/macc-uefi-build-script/actions/workflows/build.yml) <br>
[![Build Containers](https://github.com/AdrianKoshka/macc-uefi-build-script/actions/workflows/container.yml/badge.svg)](https://github.com/AdrianKoshka/macc-uefi-build-script/actions/workflows/container.yml)

## How to use

### Commandline

```shell
$ bash clone.sh
$ bash build.sh
$ bash tfa.sh
```

### Docker

```shell
$ docker build -t mubs:latest .
$ docker run --rm -it -v `pwd`:/opt mubs:latest
```

### Podman

```shell
$ buildah bud -t mubs:latest .
$ podman run --rm -it -v `pwd`:/opt:z mubs:latest
```

### Cross Compiling

For those on an `x86_64` host, the steps are mostly the same, though you'll want to make sure you install the aarch64 compiler for cross-compilng. The example below assumes you're using Ubuntu.

```shell
$ sudo apt install build-essential acpica-tools device-tree-compiler uuid-dev libssl-dev gcc-aarch64-linux-gnu --install-recommends -y
$ cd actions/master
$ bash clone.sh
$ bash build.sh
$ bash tfa.sh
```

### Docker cross compile

```shell
$ docker build -f cross-compile.Dockerfile -t mubs-cc:latest .
$ cd actions/master
$ docker run --rm -it -v `pwd`:/opt:z mubs-cc:latest
```

### Podman cross compile

```shell
$ buildah bud -f cross-compile.Dockerfile -t mubs-cc:latest .
$ cd actions/master
$ podman run --rm -it -v `pwd`:/opt:z mubs-cc:latest
```

## Burning to microSD card

`dd if=flash-image.bin of=/dev/sdX bs=512 seek=1 conv=fsync`
