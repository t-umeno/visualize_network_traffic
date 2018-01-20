#!/bin/sh
wget  "https://tools.netsa.cert.org/confluence/download/attachments/16547842/p0flib.tgz"
tar zxvpf p0flib.tgz
(cd p0flib/libp0f; ./configure; make; make install)
rm -r p0flib p0flib.tgz
