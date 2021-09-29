#!/bin/bash
set -E
pip_packages() {

   pip install requests pandas bs4 lxml matplotlib numpy tensorflow seaborn torch

}

pip_packages
