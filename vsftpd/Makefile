.PHONY: build push build_push all

build:
	docker build -t ghcr.io/idlab-discover/concap/vsftpd:hardened .

push:
	docker push ghcr.io/idlab-discover/concap/vsftpd:hardened

build_push: build push
