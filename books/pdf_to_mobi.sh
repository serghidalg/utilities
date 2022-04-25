#!/bin/bash
for book in *.pdf; do echo "Converting $book"; ebook-convert "$book" "$(basename "$book" .pdf).mobi"; done
mkdir mobi
mv *.mobi mobi/
