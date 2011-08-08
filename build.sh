#!/bin/bash

mkdir -p target/images
mkdir -p target/figs

# Build the Single HTML Page Version
asciidoc -o target/book-nexus.html book-nexus.doc 

# Build the PDF
rm -rf target/images
rm -rf target/figs
cp -r figs target
cp -r images target
a2x -v -k -fpdf -dbook --dblatex-opts=" -P latex.output.revhistory=0" -D target book-nexus.doc

# Build the Chunked HTML
a2x -v -k -fchunked -dbook --dblatex-opts=" -P latex.output.revhistory=0" -D target book-nexus.doc