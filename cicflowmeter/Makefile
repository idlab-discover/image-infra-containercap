.PHONY: build push build_push all

build:
	docker build -f src/Dockerfile -t ghcr.io/idlab-discover/concap/cicflowmeter:1.0.0 src/
	docker build -t ghcr.io/idlab-discover/concap/cicflowmeter:tools-1.0.0 .

push:
	docker push ghcr.io/idlab-discover/concap/cicflowmeter:1.0.0
	docker push ghcr.io/idlab-discover/concap/cicflowmeter:tools-1.0.0

build_push: build push