# Aliases to build & run project etc.

RM := rm -rf
MKDIR := mkdir -p
SHELL := /bin/bash
ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC := $(ROOT)/project/app/
BUILD := $(ROOT)/build/
EXAMPLES := $(ROOT)/stand-alone-examples
PRESENTATIONS := $(ROOT)/presentations

.PHONY: all clean test run

all: | $(BUILD)/Makefile
	ctags -R --exclude=.git --exclude=$(EXAMPLES) --exclude=$(PRESENTATIONS)
	$(MAKE) all -j --no-print-directory -C build

build_dir:
	$(MKDIR) $(BUILD)

clean:
	rm -rf $(BUILD)

.ONESHELL:
$(BUILD)/Makefile: | build_dir
	cmake -B$(BUILD) -S$(SRC)

test:
	$(MAKE) test --no-print-directory -C build

run:
	$(BUILD)/main/Main --port 7777 --format xml
