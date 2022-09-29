#!/bin/bash
# ex:ts=4:sw=4:sts=4:et
# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# ALQ, Hamburg 2022
# 
# sudo ./r_unit-13

if [ -f /home/cumulus/ON-01/additional.conf ]; then
        . /home/cumulus/ON-01/additional.conf
fi

PS3='Unit 13| EVPN-L3. Please enter your choice: '
options=("move to final unit status" "hands-on leaf11" "hands-on leaf11 and leaf22" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "move to final unit status")
            echo "configuring final status"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/main.yaml
            break
            ;;
        "hands-on leaf11")
            echo "hands-on leaf11"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/main.yaml
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/l11.yaml
            break
            ;;
        "hands-on leaf11 and spine13")
            echo "you chose choice hands-on leaf11 and spine13"
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/main.yaml
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/l11.yaml
            ansible-playbook -i /home/cumulus/ON-01/inventory/files/hosts ./unit-13-role/playbooks/l22.yaml
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


