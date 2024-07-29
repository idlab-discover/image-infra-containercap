.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/argus:5.0.0 .

push:
	docker push ghcr.io/idlab-discover/argus:5.0.0

build_push: build push
