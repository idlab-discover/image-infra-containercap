.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/concap/iproute2:1.0.0 .

push:
	docker push ghcr.io/idlab-discover/concap/iproute2:1.0.0

build_push: build push
