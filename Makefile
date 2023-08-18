# Copyright 2021,2022 Henrique Borges
# Copyright 2023 Samuel Martineau

SHELL:=/bin/bash

# use Docker BuildKit for faster builds with caching enabled
export DOCKER_BUILDKIT=1

# sets alpine version used on the container that will build the custom ISO
# and as the base for the custom ISO itself
export ALPINE_VERSION=$(shell https "https://dl-cdn.alpinelinux.org/alpine/" | grep -oP 'v\d+.\d+' | cut -c 2- | sort -V | tail -1)

ifndef onlychecksum
PUBLIC_SSH_KEY_URL:=$(shell read -p "Public SSH Key URL: " PUBLIC_SSH_KEY_URL; echo $$PUBLIC_SSH_KEY_URL)
endif

$(shell read -n 1 -s -r -p "Are you sure you want to build with/for Alpine v$(ALPINE_VERSION)? Press any key to continue…")

clean-container:
	docker rmi -f alpine.sh

build-container: clean-container
	docker build \
		-t alpine.sh \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		--build-arg HOST_UID=$$(id -u) \
		docker

build-iso: build-container
	mkdir -p iso
	docker run \
		--rm \
		-it \
		$(and $(onlychecksum),-e UPDATE_CHECKSUM_ONLY=0) \
		-e ALPINE_VERSION=$(ALPINE_VERSION) \
		-e PUBLIC_SSH_KEY_URL="$(PUBLIC_SSH_KEY_URL)" \
		-v $(PWD)/src:/home/builder/alpine.sh \
		-v $(PWD)/iso:/home/builder/iso \
		alpine.sh
	$(and $(onlychecksum),rm -r src/src) \

.PHONY: confirm-alpine-version clean-container build-container build-iso
.DEFAULT_GOAL := build-iso
