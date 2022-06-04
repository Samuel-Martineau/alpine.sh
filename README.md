# alpine.sh

> An answerfile and automated post-install script for Alpine Linux

### Summary

- [Generating the ISO](#generating-the-iso)
- [Installation](#installation)
- [Post-installation](#post-installation)

### Generating the ISO

> The instructions below assume you already have both `docker` and `make`
installed on your computer

Run the command below to build and run the container that will generate the ISO:

```
make build-container run-container
```

When it's done, the ISO will be located on the `iso` directory

> If you only want to only update the `APKBUILD` checksums, pass the
> `onlychecksum=0` argument when running `run-container`, example below:
>
> ```
> make run-container onlychecksum=0
> ```

### Installation

Before we proceed to the installation, a bootable media (USB drive or CD/DVD)
containing the ISO is required, in order to do that, run the following command,
replacing `/dev/sdx` with your drive:

> Do **NOT** append a partition number, so avoid things like `/dev/sdb1`

```
cp path/to/iso-file.iso /dev/sdx
```

Having done that, boot into your newly created bootable media, and log in as
root, and install `alpine.sh` package by running:

```
apk add alpine.sh
```

After installing `alpine.sh`, a answerfile will be created at
`/etc/profile.d/answerfile`, edit it accordingly to your needs, these settings
will determine many important aspects of your system

> Remember to either log out and log in again for the variables to be set on
your environment or to source it manually by running
`. /etc/profile.d/answerfile`

With that out of the way, run the command below to install Alpine:

```
setup-alpine
```

> The installation process will be entirely automated, with the exception of the
root password, and the confirmation when formatting/partitioning the disk

When the installer finishes, remove the installation media, reboot, and log-in
as root using the password you defined

### Post-installation

The `post-install` script performs the finishing touches required to make the
system more usable, to run it, simply run the `post-install` command and follow
the instructions on screen

When the post-installation is done, log-out and log-in again as your non-root
user, using the name and password you specified

And then you're done, enjoy your minimal Alpine Linux installation!
