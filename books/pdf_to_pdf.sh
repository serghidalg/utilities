#!/bin/bash
#sudo apt-get install texlive-extra-utils
for book in *.pdf; do echo "Converting $book"; pdfcrop "$book" "$(basename "$book" .pdf)_transform.pdf"; mv "$(basename "$book" .pdf)_transform.pdf" mobi/"$(basename "$book" .pdf)_transform.pdf"; done
#add the following parameters to tune left-top-right-bot margins specifically pdfcrop --margins '0 0 0 -30'
