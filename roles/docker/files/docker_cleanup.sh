#!/bin/bash

# Do not run if removal already in progress.
/usr/bin/pgrep "docker rm" && exit 0

# Remove Dead and Exited containers.
/usr/bin/docker rm $(/usr/bin/docker ps -a | /bin/grep "Dead\|Exited" | /usr/bin/awk '{print $1}'); true

# It will fail to remove images currently in use.
/usr/bin/docker rmi $(/usr/bin/docker images -q); true

# Clean up unused docker volumes
/usr/bin/docker volume rm $(/usr/bin/docker volume ls -q); true
