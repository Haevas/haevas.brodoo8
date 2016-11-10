#!/bin/bash

cd ../..
ansible-playbook -i local, -c local -t brodoo_odoo_addons playbook.yml
