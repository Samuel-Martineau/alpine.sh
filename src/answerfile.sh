#!/bin/sh
# Copyright 2021,2022 Henrique Borges
# Copyright 2023 Samuel Martineau

# exports all variables
set -a

KEYMAPOPTS="us us"

# -n -> hostname to set non-interactively
# HOSTNAMEOPTS="-n alpine"

# -a -> automatic interface setup using DHCP
# -b -> ask for briding of interfaces
# -i -> read new contents of "/etc/network/interfaces" from stdin
# -p -> set the system root to operate in
# -r -> restart the networking service after the setup
# INTERFACESOPTS="
# auto lo
# iface lo inet loopback

# auto eth0
# iface eth0 inet dhcp
#     hostname alpine
# "

# -d -> specify search domain name
DNSOPTS="-d . 1.1.1.1"

# -i -> install "tzdata" and symlink instead of making a copy
# -k -> keep previous copies of "tzdata"
# -z -> set given timezone (relative to "/usr/share/zoneinfo")
TIMEZONEOPTS="-z America/Toronto"

# -q -> quiet mode
PROXYOPTS="none"

# -c -> enable the community repo
# -f -> detect and add the fastest mirror
# -r -> add a random mirror and do not prompt
# -1 -> add first mirror on the list (normally a CDN)
APKREPOSOPTS="-f -c"

# -a -> create admin user, add to wheel group and set up doas
# -u -> Unlock the user automatically (eg. creating the user non-interactively
#       with an ssh key for login)
# -f -> set full name for user
# -g -> comma or space separated list of groups to add user to
# -k -> SSH key or URL to SSH key (e.g: https://gitlab.alpinelinux.org/user.keys)
#       or 'none' for no key
USEROPTS="-a -u -f Admin -k yes admin"

# -k -> authorized key for root (HTTP(S)/FTP URL, the public key itself or 'none')
# choice of SSH daemon: openssh, dropbear, none
SSHDOPTS="openssh"

# choice of NTP daemon: busybox, openntpd, chrony, none
NTPOPTS="chrony"

# -e -> encrypt disk
# -m -> use disk for mode without asking, where MODE is either 'data' or 'sys'
# -o -> restore system from given apkovl file
# -k -> use kernelflavor instead of lts
# -L -> use LVM to manage partitions
# -q -> exit quietly if no disks are found
# -r -> enable software raid1 with single disk
# -s -> use SWAPSIZE MB instead of autodetecting swap size (use 0 to disable swap)
# -v -> be more verbose about what is happening
DISKOPTS="-m sys"
