SHELL := /usr/bin/env fish

all: fmt lint test

fmt:
	@fish_indent --write **.fish

lint:
	@for file in **.fish; fish --no-execute $$file; end

install: install-fisher
	@fisher install . >/dev/null

test: install-clownfish install-fishtape
	@fishtape tests/**.test.fish

install-fisher:
	@type -q fisher || begin; curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher; end

install-clownfish:
	@type -q mock || fisher install IlanCosman/clownfish

install-fishtape:
	@type -q fishtape || fisher install jorgebucaran/fishtape

.PHONY: \
	all \
	fmt \
	install \
	install-clownfish \
	install-fisher \
	install-fishtape \
	lint \
	test
