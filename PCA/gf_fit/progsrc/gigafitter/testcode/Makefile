#!gmake
##################################################
#
# Makefile for gigafitter
#
# $Id$
#
###################################################

include ../../config.mk

CFLAGS += -I../inc

OBJ = main.o

all: gigafitter

gigafitter: $(OBJ) 
	gcc -o $@ $(OBJ) -L../lib -l$(LIBNAME) -lm
	mv $@ ../bin/

clean:
	rm -f *.o  ../bin/gigafitter
