CFLAGS = -D_GNU_SOURCE -Wall -g
LIBS = -lncursesw -ltinfo
INCLUDES = -I procps/ -I procps/library/include/ -I procps/local/
SOURCES = procps/src/hugetop.c procps/library/*.c procps/local/*.c
BIN = hugetop
CC=gcc
DESTDIR =

BINPATH = /usr/bin/
MAN1PATH = /usr/share/man/man1/

prepare:
	$(shell cd procps && ./autogen.sh > /dev/null && ./configure > /dev/null)

CONFIG = $(shell sh -c './config.sh')

bin: prepare
	rm -f $(BIN)
	$(CC) $(SOURCES) $(INCLUDES) $(CFLAGS) $(CONFIG) $(LIBS) -o $(BIN)

install: bin
	install -D $(BIN) $(DESTDIR)$(BINPATH)/$(BIN)
	install -D procps/man/hugetop.1 $(DESTDIR)/$(MAN1PATH)/hugetop.1
