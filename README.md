# ELK6
install ELK6 with YAF, super_mediator, curl and wireshark on ubuntu/xenial64

## requirements
* VirtualBox
* Vagrant
* Ansible ( >= 2.2)
* vagrant plugin install vagrant-disksize
## Usage
    vagrant plugin install vagrant-disksize
    cd ansible/ELK6/playbooks
    vagrant up
    ansible-playbook ELK6.yml
