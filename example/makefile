# This makefile is designed to be run by gnu make.
# The default make program on FreeBSD 8.1 is not gnu make; to install gnu make:
#    pkg_add -r gmake
# and then run as gmake rather than make.

all:
	dmd ./simpleHello.d ../Gadu.d -I../ -L-lgadu -O -release -inline -nofloat -w 
	rm ./simpleHello.o