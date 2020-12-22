# Macchiatobin UEFI Build Scripts

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