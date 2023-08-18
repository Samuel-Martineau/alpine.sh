[//]: # "Copyright 2021,2022 Henrique Borges"
[//]: # "Copyright 2023 Samuel Martineau"

# alpine.sh

> An answerfile and automated post-install script for Alpine Linux

> Forked from https://git.sr.ht/~henriquehbr/alpine.sh

> After cloning, execute `git config core.hooksPath hooks` to enable git hooks

### Generating the ISO

> The instructions below assume you already have both `docker` and `make`
> installed on your computer

Run the command below to build and run the container that will generate the ISO:

```
make build-iso
```

When it's done, the ISO will be located on the `iso` directory

> If you only want to only update `APKBUILD` checksums, pass the
> `onlychecksum=0` argument when running `build-iso`, example below:
>
> ```
> make build-iso onlychecksum=0
> ```

### Installation

Boot into the newly created bootable media, and log in as
root, and install `alpine.sh` package by running:

```
apk add alpine.sh
```

After installing `alpine.sh`, an answerfile will be created at
`/etc/profile.d/answerfile`, edit it accordingly to your needs, these settings
will determine many important aspects of your system

> Remember to either log out and log in again for the variables to be set on
> your environment or to source it manually by running
> `. /etc/profile.d/answerfile`

With that out of the way, run the command below to install Alpine:

```
setup-alpine
```

> The installation process will be entirely automated, with the exception of the
> root password, and the confirmation when formatting/partitioning the disk

When the installer finishes, remove the installation media, reboot, and log-in
as root using the password you defined

### Post-installation

The `post-install` script performs the finishing touches required to make the
system more usable, to run it, simply run `sh - -c post-install` while connected to the `admin` user over SSH and follow the instructions on screen

And then you're done, enjoy your minimal Alpine Linux installation!
