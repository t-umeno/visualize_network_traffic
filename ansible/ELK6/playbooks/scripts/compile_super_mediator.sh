#!/bin/sh
( cd $HOME && wget https://tools.netsa.cert.org/releases/super_mediator-${super_mediator_version}.tar.gz && tar zxvpf super_mediator-${super_mediator_version}.tar.gz && (cd super_mediator-${super_mediator_version} && ./configure && make && make install) && rm -r super_mediator-${super_mediator_version} super_mediator-${super_mediator_version}.tar.gz )


