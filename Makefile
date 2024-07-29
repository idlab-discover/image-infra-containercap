SUBDIRS := $(shell find . -mindepth 2 -type f -name "Makefile" -exec dirname {} \;)

.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ build_push
