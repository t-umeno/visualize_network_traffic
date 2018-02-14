#!/bin/sh
( cd $HOME && wget https://tools.netsa.cert.org/releases/yaf-2.9.3.tar.gz && tar zxvpf yaf-2.9.3.tar.gz && (cd yaf-2.9.3 && ./configure --enable-ndpi --enable-plugins --enable-applabel --enable-p0fprinter --enable-entropy && make && make install) && rm -r yaf-2.9.3 yaf-2.9.3.tar.gz )
