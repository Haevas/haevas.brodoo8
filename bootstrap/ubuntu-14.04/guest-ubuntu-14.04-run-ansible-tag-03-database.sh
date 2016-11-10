#!/bin/bash

cd ../..
ansible-playbook -i local, -c local -t brodoo_database playbook.yml
