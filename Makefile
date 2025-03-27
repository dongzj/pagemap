# Makefile for pagemap
OUTPUT_DIR = output
ARCH ?= $(shell uname -m)

CC = gcc
CFLAGS = -std=c99
ifeq ($(ARCH),aarch64)
    CFLAGS += -march=armv8-a
else ifeq ($(ARCH),x86_64)
    CFLAGS += -march=x86-64
endif

.PHONY: all
all: output/pagemap output/pagemap2

output/pagemap: pagemap.c
	mkdir -p output
	$(CC) $(CFLAGS) $^ -o $@
output/pagemap2: pagemap2.c
	mkdir -p output
	$(CC) $(CFLAGS) $^ -o $@

.PHONY: clean
clean:
	-rm output/pagemap output/pagemap2
