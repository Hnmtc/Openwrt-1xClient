#
	# Name:         1xClient
	# Version:      2.0
	# Description:  Main Program For 1xClient
	# Created:      2019-03-01
	# Copyright (C) 2019-2022 Hsy <info@hsy.ink>
#

LIBS = -lpcap -liconv
.PHONY: all
all: 1xClient

1xClient:md5.o 1xClient.o
	$(CC) $(CFLAGS) -o $@ md5.o 1xClient.o $(LIBS)

md5.o:md5.c md5.h
	$(CC) $(CFLAGS) -c $<

1xClient.o:1xClient.c
	$(CC) $(CFLAGS) -c $<

clean:
	${RM} *.o 1xClient