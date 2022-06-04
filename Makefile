# use Docker BuildKit for faster builds with caching enabled
export DOCKER_BUILDKIT=1

export ALPINE_VERSION=3.16

clean-container:
	docker rmi -f alpine.sh

build-container: clean-container
	docker build \
		-t alpine.sh \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		--build-arg HOST_UID=$$(id -u) \
		docker

run-container:
	mkdir -p iso
	docker run \
		--rm \
		-it \
		$(and $(onlychecksum),-e UPDATE_CHECKSUM_ONLY=0) \
		-e ALPINE_VERSION=$(ALPINE_VERSION) \
		-v $(PWD)/src:/home/builder/alpine.sh \
		-v $(PWD)/iso:/home/builder/iso \
		alpine.sh
	$(and $(onlychecksum),rm -r src/src) \

release:
	docker run \
		--rm \
		-t \
		-v $(PWD):/repo \
		-e GIT_NAME="$$(git config user.name)" \
		-e GIT_EMAIL="$$(git config user.email)" \
		henriquehbr/tagit:latest \
		./bump-apkbuild
