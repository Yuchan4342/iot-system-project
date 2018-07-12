# Makefile

build:
	cd "$(PWD)/src" && make

.PHONY: clean
clean:
	cd "$(PWD)/src" && make clean