# visualize_network_traffic
## ELK6
install ELK6 with YAF, super_mediator, curl and wireshark on ubuntu/xenial64

### requirements
* VirtualBox
* Vagrant
* Ansible ( >= 2.2)
* vagrant plugin install vagrant-disksize

### install
    vagrant plugin install vagrant-disksize
    cd ansible/ELK6/playbooks
    vagrant up
    ansible-playbook ELK6.yml

### usage (shell)
    cd ansible/ELK6/playbooks
    vagrant ssh
    vagrant@ubuntu-xenial:~$ super_mediator.sh
    vagrant@ubuntu-xenial:~$ yaf.sh enp0s8 >& /dev/null

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
