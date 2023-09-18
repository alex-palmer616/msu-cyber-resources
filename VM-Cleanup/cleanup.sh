#!/bin/bash

# Cleanup Script for Web-Labs
# !! MUST BE RAN WITH/AS root using sudo
cd /home/sysadmin/Documents/web-vulns/
docker-compose down
cd /home/sysadmin/Cybersecurity-Lesson-Plans/12-Web_Dev/deploying_testing_activity
docker-compose down
cd /home/sysadmin/Documents/docker_files
docker-compose down
docker stop $(docker ps -q)
docker image prune -asudo journalctl --vacuum-time=1s
find /var/log/ -type f -exec du -h {} \; | sort -rh | awk '{print $2}' | xargs sudo rm -f
journalctl --vacuum-time=1s
rm -rf /opt/nessus