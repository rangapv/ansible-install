#!/usr/bin/env bash
set -E
pip_packages() {

   $pi3 install requests pandas bs4 lxml matplotlib sklearn numpy tensorflow seaborn torch
   $pi3 install gsheetsdb streamlit
   $pi3 install pyOpenSSL
   
   #Install spacy
   $pi3 install spacy
   python -m spacy download en_core_web_sm

   #Install nltk
   $pi3 install nltk
   python -m nltk.downloader stopwords
   python -m nltk.downloader punkt
   python -m nltk.downloader wordnet 

}
pi3="pip3"
pip_packages
