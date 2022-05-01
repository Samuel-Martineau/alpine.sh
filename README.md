# alpine.sh

> An answerfile and automated post-install script for Alpine Linux

### Summary

- [Generating the ISO](#generating-the-iso)
- [Installation](#installation)

### Generating the ISO

> The instructions below assume you already have both `docker` and `make`
installed on your computer

Run the command below to build and run the container that will generate the ISO:

```
make build-container run-container
```

When it's done, the ISO will be located on the `iso` directory

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

After installing `alpine.sh`, a answerfile will be created at `/usr/bin/answerfile`,
edit it accordingly to your needs and run the command below to install Alpine:

```
setup-alpine -f /usr/bin/answerfile
```

> The installation process will be entirely automated, with the exception of the
root password, and the confirmation when formatting/partitioning the disk

When the installer finishes, remove the installation media and reboot the
computer, log in as root, and run `post-install` (simply by typing it's name)
to perform the finishing touches required to make the system more usable, and
after that, logout, and log in again as your (non-root) user
