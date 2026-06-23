# nmake Makefile

CC      = cl
LIB     = lib
CFLAGS  = /nologo /c /Iinclude
LIBFLAGS = /nologo

GETOPT_H_URL = https://raw.githubusercontent.com/mingw-w64/mingw-w64/refs/heads/master/mingw-w64-headers/crt/getopt.h
GETOPT_C_URL = https://raw.githubusercontent.com/mingw-w64/mingw-w64/refs/heads/master/mingw-w64-crt/misc/getopt.c

GETOPT_H   = include\getopt.h
GETOPT_C   = src\getopt.c
GETOPT_OBJ = obj\getopt.obj
GETOPT_LIB = lib\getopt.lib

all: $(GETOPT_LIB)

$(GETOPT_H):
	@if not exist include mkdir include
	curl -L -o $(GETOPT_H) $(GETOPT_H_URL)

$(GETOPT_C):
	@if not exist src mkdir src
	curl -L -o $(GETOPT_C) $(GETOPT_C_URL)

$(GETOPT_OBJ): $(GETOPT_C) $(GETOPT_H)
	@if not exist obj mkdir obj
	$(CC) $(CFLAGS) /Fo$(GETOPT_OBJ) $(GETOPT_C)

$(GETOPT_LIB): $(GETOPT_OBJ)
	@if not exist lib mkdir lib
	$(LIB) $(LIBFLAGS) /OUT:$(GETOPT_LIB) $(GETOPT_OBJ)

clean:
	@if exist $(GETOPT_OBJ) del $(GETOPT_OBJ)
	@if exist $(GETOPT_LIB) del $(GETOPT_LIB)

distclean: clean
	@if exist $(GETOPT_H) del $(GETOPT_H)
	@if exist $(GETOPT_C) del $(GETOPT_C)

.PHONY: all clean distclean
