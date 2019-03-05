
#!/bin/sh
( cd $HOME && ( wget https://snort.org/downloads/snort/daq-${daq_version}.tar.gz || wget https://snort.org/downloads/archive/snort/daq-${daq_version}.tar.gz ) && tar zxvpf daq-${daq_version}.tar.gz && (cd daq-${daq_version} && ./configure && make && make install) && rm -r daq-${daq_version} daq-${daq_version}.tar.gz )
