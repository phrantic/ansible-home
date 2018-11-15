#!/bin/bash

read -p "enter host name:" hosts_pat
read -p "enter elevated user:" elevated_user
read -sp "enter phrantic password:" phr_pw
read -sp "enter su user password ($elevated_user):" su_pw

echo "ansible_become_pass: $su_pw" > pwd.yml
echo "ansible_ssh_pass: $phr_pw" >> pwd.yml

ansible-playbook -i inventory/ --limit="$hosts_pat" bootstrap/add_key.yml --extra-vars '@pwd.yml' --become-user=$elevated_user -u phrantic

echo Removing temp file pwd.yml
rm -rf pwd.yml
 
