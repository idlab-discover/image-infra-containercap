.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/concap/patator:cic -f Dockerfile.cic .

push:
	docker push ghcr.io/idlab-discover/concap/patator:cic

build_push: build push
