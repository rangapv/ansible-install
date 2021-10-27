#!/bin/bash
set -E
pip_packages() {

   pip install requests pandas bs4 lxml matplotlib sklearn numpy tensorflow seaborn torch
   pip install gsheetsdb streamlit
   pip install pyOpenSSL
   
   #Install spacy
   pip install spacy
   python -m spacy download en_core_web_sm

   #Install nltk
   pip install nltk
   python -m nltk.downloader stopwords
   python -m nltk.downloader punkt
   python -m nltk.downloader wordnet 

}

pip_packages
