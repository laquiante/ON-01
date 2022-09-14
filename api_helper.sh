#!/bin/bash

# ALQ, Wittdün 2022

# Vorbereiten für NVUE API 
# auf den CL5.x Geräten

echo "Step-01: Using Ansible ad-hoc command to prepare nginx with nvue.conf

ansible -b leaf11 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf12 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf21 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf22 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine13 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine14 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine23 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine24 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b wan01 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b wan02 -a "sudo ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"

echo "Step-02: Using Ansible ad-hoc to open up nginx"

ansible -b leaf11 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf12 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf21 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf22 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine13 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine14 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine23 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine24 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b wan01 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b wan02 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"

echo "Step-03: "Using Ansible ad-hoc to restart nginx"

ansible -b leaf11 -a "systemctl restart nginx"
ansible -b leaf12 -a "systemctl restart nginx"
ansible -b leaf21 -a "systemctl restart nginx"
ansible -b leaf22 -a "systemctl restart nginx"
ansible -b spine13 -a "systemctl restart nginx"
ansible -b spine14 -a "systemctl restart nginx"
ansible -b spine23 -a "systemctl restart nginx"
ansible -b spine24 -a "systemctl restart nginx"
ansible -b wan01 -a "systemctl restart nginx"
ansible -b wan02 -a "systemctl restart nginx"

echo "Step-04: Tesing leaf11 for API access"

# Fehlersuche per
# sudo ss -tulpn | grep LISTEN

erg=$(curl  -u 'cumulus:CumulusLinux!' --insecure https://192.168.200.2:8765/cue_v1/interface)

if [[ $erg == *"Authorization Required"* ]]; then
  echo "Please verify if nginx is correctly configured on leaf11 and up & running"
fi

# Zum Testen

erg=$(curl  -u 'cumulus:BadPassword' --insecure https://192.168.200.2:8765/cue_v1/interface)

if [[ $erg == *"Authorization Required"* ]]; then
  echo "Please verify if nginx is correctly configured on leaf11 and up & running"
fi
