#!/bin/sh
wget https://tools.netsa.cert.org/releases/super_mediator-1.5.3.tar.gz
tar zxvpf super_mediator-1.5.3.tar.gz
(cd super_mediator-1.5.3; ./configure; make; make install)
rm -r super_mediator-1.5.3 super_mediator-1.5.3.tar.gz


