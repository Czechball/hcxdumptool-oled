NAME := hcxoled
PREFIX ?= /usr/local
INSTALL ?= install
CC ?= gcc
LIBS := libpcre2-8
CFLAGS += -std=c11 $(shell pkg-config --cflags $(LIBS))
LDFLAGS += -Wl,-S $(shell pkg-config --libs $(LIBS))

SRC = source.c
OBJ = $(SRC:%.c=%.o)

TRASH = $(OBJ) $(NAME)

.PHONY: all clean install uninstall

all: $(NAME)
clean:
	@rm $(TRASH) | true
install:
	$(INSTALL) $(NAME) $(DESTDIR)/bin
uninstall:
	rm -f $(DESTDIR)$(BINDIR)
$(NAME): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) $(LDLIBS) -o $@
