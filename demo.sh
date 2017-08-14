#!/bin/bash

# NOTE: Please run one-by-one, NOT as a script

ansible all -m shell -a "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys" -f 4 -k

ansible-playbook playbook.yml
ansible all -a "apt autoremove -y" -f 4 --become
ansible masters -a "apt autoremove -y" --become
ansible slaves -a "apt autoremove -y" -f 3 --become
