#!/usr/bin/env make

.PHONY: all test

# Nothing to compile
all:

test:
	bats test

install:
	pip install -e .
