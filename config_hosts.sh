#!/bin/bash

read -p "enter host name:" hosts_pat

ansible-playbook -i inventory/vagrant.py --limit="$hosts_pat" config_hosts.yml
