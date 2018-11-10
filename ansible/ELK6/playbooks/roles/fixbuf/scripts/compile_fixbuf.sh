#!/bin/sh
( cd $HOME && wget https://tools.netsa.cert.org/releases/libfixbuf-${fixbuf_version}.tar.gz && tar zxvpf libfixbuf-${fixbuf_version}.tar.gz && (cd libfixbuf-${fixbuf_version} && ./configure --with-openssl && make && make install) && rm -r libfixbuf-${fixbuf_version} libfixbuf-${fixbuf_version}.tar.gz )
