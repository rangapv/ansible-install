#!/bin/bash
set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/ansible-install/py.sh) >>/dev/null 2>&1

ansible() {


ansible -m ping localhost

}


ansible
