#!/bin/sh
( cd $HOME && wget "https://tools.netsa.cert.org/releases/p0flib.tar.gz" && tar zxvpf p0flib.tar.gz && (cd p0flib/libp0f && ./configure &&  make && make install) && rm -r p0flib p0flib.tar.gz )
