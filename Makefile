CFLAGS = -D_GNU_SOURCE -DHAVE_STDIO_EXT_H -DNUMA_DISABLE -Wall -g
LIBS = -lncursesw -ltinfo
INCLUDES = -I procps/ -I procps/library/include/ -I procps/local/
SOURCES = procps/src/hugetop.c procps/library/*.c procps/local/*.c
BIN = hugetop
CC=gcc
DESTDIR =

BINPATH = /usr/bin/
MAN1PATH = /usr/share/man/man1/

bin:
	$(shell cd procps && ./autogen.sh > /dev/null && ./configure > /dev/null)
	rm -f $(BIN)
	$(CC) $(SOURCES) $(INCLUDES) $(CFLAGS) $(LIBS) -o $(BIN)

install: bin
	install -D $(BIN) $(DESTDIR)$(BINPATH)/$(BIN)
	install -D procps/man/hugetop.1 $(DESTDIR)/$(MAN1PATH)/hugetop.1
