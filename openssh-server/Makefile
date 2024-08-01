.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/concap/openssh-server:cic -f Dockerfile.cic .
	docker build -t ghcr.io/idlab-discover/concap/openssh-server:password-16.04 --build-arg IMAGE_VERSION=16.04 --build-arg SETUP_SCRIPT=config/password-setup.sh .
	docker build -t ghcr.io/idlab-discover/concap/openssh-server:password-24.04 --build-arg IMAGE_VERSION=24.04 --build-arg SETUP_SCRIPT=config/password-setup.sh .

push:
	docker push ghcr.io/idlab-discover/concap/openssh-server:cic
	docker push ghcr.io/idlab-discover/concap/openssh-server:password-16.04
	docker push ghcr.io/idlab-discover/concap/openssh-server:password-24.04

build_push: build push
