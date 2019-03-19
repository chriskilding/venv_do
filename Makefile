#!/usr/bin/env make

prefix = /usr/local

.PHONY: all test install uninstall

# Nothing to compile
all:

test:
	shellcheck venv-do
	bats test

install:
	mkdir -p $(DESTDIR)$(prefix)/bin $(DESTDIR)$(prefix)/share/man/man1
	install venv-do $(DESTDIR)$(prefix)/bin
	install venv-do.1 $(DESTDIR)$(prefix)/share/man/man1

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/venv-do
	-rm -f $(DESTDIR)$(prefix)/share/man/man1/venv-do.1
