.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/concap/cicflowmeter:1.0.0 src/

push:
	docker push ghcr.io/idlab-discover/concap/cicflowmeter:1.0.0

build_push: build push