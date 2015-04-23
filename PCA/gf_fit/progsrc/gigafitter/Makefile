#!gmake
##################################################
#
# Makefile for gffit
#
# $Id$
#
###################################################

all: libgffit 
	$(MAKE) -C testcode

libgffit:
	$(MAKE) -C src

clean:
	$(MAKE) clean -C src
	$(MAKE) clean -C testcode
