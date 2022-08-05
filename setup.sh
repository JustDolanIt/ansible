#!/bin/bash

export ENVIRONMENT=$(cat hosts.yml | grep env | awk -F ' ' '{print $2}')

./run_playbook.sh common.yml
./run_playbook.sh docker.yml
./run_playbook.sh gitlab-runner.yml
./run_playbook.sh swarm.yml
