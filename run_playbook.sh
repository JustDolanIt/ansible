#!/bin/bash

[[ $# -lt 1 ]] && echo "You must pass ansible playbook to run" && exit 1

export ENVIRONMENT=$(cat hosts.yml | grep env | awk -F ' ' '{print $2}')

ansible-playbook -i hosts.yml --private-key ../terraform/ssh/$ENVIRONMENT $1
