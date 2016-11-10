#!/bin/bash

cd ../..
ansible-playbook -i local, -c local -t brodoo_os_packages playbook.yml
