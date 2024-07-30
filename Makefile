SUBDIRS := $(shell find . -mindepth 2 -type f -name "Makefile" -exec dirname {} \;)

.PHONY: all $(SUBDIRS)

all: build_push

build_push: $(SUBDIRS)
build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
