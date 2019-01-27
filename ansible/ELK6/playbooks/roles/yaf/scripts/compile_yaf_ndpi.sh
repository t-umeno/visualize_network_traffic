#!/bin/sh
( cd $HOME && wget https://tools.netsa.cert.org/releases/yaf-${yaf_version}.tar.gz && tar zxvpf yaf-${yaf_version}.tar.gz && (cd yaf-${yaf_version} && ./configure --enable-ndpi --enable-plugins --enable-applabel --enable-p0fprinter --enable-entropy && make && make install) && rm -r yaf-${yaf_version} yaf-${yaf_version}.tar.gz )
