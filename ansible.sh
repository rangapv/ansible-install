#!/bin/bash
set -E
#source <(curl -s https://raw.githubusercontent.com/rangapv/ansible-install/main/py.sh)
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1

ansible() {

sudo $cm1 -y install python3-pip
sudo $cm1 -y install build-essential libssl-dev libffi-dev python-dev
sudo $cm1 install selinux-utils
sudo $cm1 -y install policycoreutils
sudo $cm1 install selinux-basics
sudo setenforce 0
sudo $cm1 update
sudo $cm1 install software-properties-common
sudo -H pip install ansible
ansible --version
ansible -m ping localhost

}

echo "Installing ansible"
ansible
