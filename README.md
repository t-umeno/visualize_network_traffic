# visualize_network_traffic
## ELK6
* install ELK6 with YAF, super_mediator, curl and wireshark on ubuntu/xenial64
* JSON files and Elasticsearch indicies created before 30 days are automatically deleted.
### requirements
* VirtualBox
* Vagrant
* vagrant plugin install vagrant-disksize
* vagrant plugin install vagrant-proxyconf (if you use proxy)
* vagrant plugin install vagrant-vbguest (option)

### install
Please set http_proxy and https_proxy if you need.
execute "vagrant up" and select NIC for receive packets
execute "vagrant ssh" and check JSON file in ~/yaf/json

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
    (snip)
    PLAY RECAP *********************************************************************
    testserver                 : ok=44   changed=40   unreachable=0    failed=0       
    
    $ vagrant ssh
    (snip)
    vagrant@ubuntu-xenial:~$ ls -l yaf/json
    total 2396
    -rw-r--r-- 1 root root 2447363 Dec 18 06:11 yaf.20181217154009.json
    vagrant@ubuntu-xenial:~$ 

### usage (kibana)
Please use firefox or chrome.
- open http://127.0.0.1:5601/
- select "Management"
- select "Index Patterns"
- select "Create Index Pattern"
- input "yaf*" in index pattern
- select "@timestamp" in Time Filter field name
- push "Create index pattern"
- select "Management"
- select "Saved Objects"
- push "Import"
- File Upload: kibana6/export.json
- push "No, prompt for each object"
- select "yaf*" as "New index pattern"
- push "Confirm all changes"
- select "Dashboard"
- select "main", "bar", "bar2", "circle" or "circle2"
- enjoy!

### usage (grafana)
- open http://127.0.0.1:3000/
- login (username: admin password: admin)
- change password
- push "Add data source"
- push "Elasticsearch" from "Choose data source type"
- input "yaf" in Name
- input "http://localhost:9200" in URL
- input "yaf.*" in Elasticsearch details Index Name
- select "6.0+" in Elasticsearch deaiils Version
- push "Save & Test"
- select "+" and "Import"
- push "Upload .json File"
- upload "grafana/ElasticSearch YAF count.json"
- select "yaf" from "Select a Elasticsearch data source"
- push "Import"
- enjoy!

### ToDo
- document
