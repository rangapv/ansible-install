#!/bin/bash
set -E
pip_packages() {

   pip install requests pandas bs4 lxml matplotlib sklearn numpy tensorflow seaborn torch
   pip install gsheetsdb streamlit
}

pip_packages
