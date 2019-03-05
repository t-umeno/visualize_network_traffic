#!/bin/sh
( cd $HOME && wget https://github.com/shirkdog/pulledpork/archive/master.tar.gz -O pulledpork-master.tar.gz && tar zxvpf pulledpork-master.tar.gz && (cd pulledpork-master && cp pulledpork.pl /usr/local/bin && chmod +x /usr/local/bin/pulledpork.pl && mkdir -p /etc/snort && cp etc/*.conf /etc/snort) && rm -r pulledpork-master pulledpork-master.tar.gz )
