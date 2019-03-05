#!/bin/sh
( cd $HOME && ( wget https://snort.org/downloads/snort/snort-${snort_version}.tar.gz || wget https://snort.org/downloads/archive/snort/snort-${snort_version}.tar.gz ) && tar zxvpf snort-${snort_version}.tar.gz && (cd snort-${snort_version} && ./configure --enable-sourcefire --disable-open-appid && make && make install) )
