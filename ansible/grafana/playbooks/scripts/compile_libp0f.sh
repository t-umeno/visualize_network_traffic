#!/bin/sh
( cd $HOME && wget "http://ftp2.za.freebsd.org/pub/FreeBSD/ports/distfiles/p0flib.tgz" && tar zxvpf p0flib.tgz && (cd p0flib/libp0f && ./configure &&  make && make install) && rm -r p0flib p0flib.tgz )
