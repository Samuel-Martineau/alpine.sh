# use Docker BuildKit for faster builds with caching enabled
export DOCKER_BUILDKIT=1

build-container:
	docker build \
		-t alpine.sh \
		--build-arg HOST_UID=$$(id -u) \
		docker

run-container:
	mkdir -p iso
	docker run \
		--rm \
		-it \
		-v $(PWD)/src:/home/builder/alpine.sh \
		-v $(PWD)/iso:/home/builder/iso \
		alpine.sh
