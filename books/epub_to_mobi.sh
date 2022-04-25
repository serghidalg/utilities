#!/bin/bash
echo "#############################################################"
echo "# Converting all your epub files to mobi"
echo "#############################################################"


for book in *.epub; do echo "Converting $book"; ebook-convert "$book" "$(basename "$book" .epub).mobi"; done
mkdir mobi
mv *.mobi mobi/
