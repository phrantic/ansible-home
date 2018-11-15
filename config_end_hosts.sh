#!/bin/bash

read -p "enter host name:" hosts_pat

ansible-playbook -i inventory/hosts config_end_hosts.yml --limit="$host_pat" -b -u vagrant -k
