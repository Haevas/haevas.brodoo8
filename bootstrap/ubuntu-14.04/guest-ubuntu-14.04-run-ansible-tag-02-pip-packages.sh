#!/bin/bash

cd ../..
ansible-playbook -i local, -c local -t brodoo_pip_packages playbook.yml
