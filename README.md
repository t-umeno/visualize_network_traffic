# visualize_network_traffic
## ELK6
install ELK6 with YAF, super_mediator, curl and wireshark on ubuntu/xenial64

### requirements
* VirtualBox
* Vagrant
* vagrant plugin install vagrant-disksize

### install
Please set http_proxy and https_proxy if you need.

    $ export http_proxy="http://aaa.bbb.ccc.ddd:8080/" # option
    $ export https_proxy="http://aaa.bbb.ccc.ddd:8080/" # option
    $ vagrant plugin install vagrant-disksize
    $ cd ansible/ELK6/playbooks
    $ vagrant up
    (snip)
    (select network interface for packet capture)
    ==> default: Available bridged network interfaces:
    1) en1: Wi-Fi (AirPort)
    2) bridge0
    3) en0: Ethernet
    4) en2: Thunderbolt 1
    5) p2p0
    ==> default: When choosing an interface, it is usually the one that is
    ==> default: being used to connect to the internet.
        default: Which interface should the network bridge to? 3

### usage (shell)
    $ cd ansible/ELK6/playbooks
    $ vagrant ssh
    vagrant@ubuntu-xenial:~$ super_mediator.sh
    vagrant@ubuntu-xenial:~$ yaf.sh enp0s8 >& /dev/null &

### usage (browser)
- open http://127.0.0.1:5601/
- select "Management"
- select "Index Patterns"
- select "Create Index Pattern"
- input "yaf*" in index pattern
- select "@timestamp" in Time Filter field name
- push "Create index pattern"
- select "Maagement"
- select "Saved Objects"
- push "Import"
- File Upload: kibana6/export.json
- push "No, prompt for each object"
- select "yaf*" as "New index pattern"
- push "Confirm all changes"
- select "Dashboard"
- select "main" or select "bar"
- enjoy!
