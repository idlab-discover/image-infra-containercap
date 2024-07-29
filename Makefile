SUBDIRS := $(shell find . -type f -name "Makefile" -exec dirname {} \;)

.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ build_push
