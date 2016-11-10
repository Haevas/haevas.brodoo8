#!/bin/bash

cd ../..
ansible-galaxy install -r requirements.yml
ansible-playbook -i local, -c local playbook.yml --sudo

#cd bootstrap/ubuntu-14.04
#./guest-ubuntu-14.04-run-ansible-tag-01-os-packages.sh*
#./guest-ubuntu-14.04-run-ansible-tag-02-pip-packages.sh*
#./guest-ubuntu-14.04-run-ansible-tag-03-database.sh*
#./guest-ubuntu-14.04-run-ansible-tag-04-odoo.sh*
#./guest-ubuntu-14.04-run-ansible-tag-05-addons.sh*
