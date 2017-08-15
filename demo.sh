#!/bin/bash

# NOTE: Please run one-by-one, NOT as a script

# Mark our public keys as authorized
ansible all -m shell -a "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys" -f 4 -k

# Run roles for relevant nodes
ansible-playbook playbook.yml

# Run ad-hoc commands for fun
ansible all -a "apt autoremove -y" -f 4 --become
ansible masters -a "apt autoremove -y" --become
ansible slaves -a "apt autoremove -y" -f 3 --become
