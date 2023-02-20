#!/bin/bash
# ex:ts=4:sw=4:sts=4:et
# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# ALQ, Wittdün 2023
# 
# sudo ./andreas-unit-53

if [ -f /home/cumulus/ON-01/additional.conf ]; then
        . /home/cumulus/ON-01/additional.conf
fi

PS3='Unit 51| Playbook lab. Please enter your choice: '
options=("run playbook for leaf11" "run playbook for leaf11_vars" "run playbook with tags" "enable NVUE on leaf11" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "run playbook for leaf11")
            echo "configuring final status"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./andreas-unit-53/playbooks/main.yaml
            break
            ;;
        "run playbook for leaf11_vars")
            echo "configuring final status"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./andreas-unit-53/playbooks/main_vars.yaml
            break
            ;;
        "enable NVUE on leaf11")
            echo "enabling and starting nvue daemons"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./andreas-unit-53/playbooks/main_nvue.yaml
            break
            ;;
         "run playbook with tags")
            echo "practice tag use"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./andreas-unit-53/playbooks/main_tag.yaml --tags expert.yaml
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
