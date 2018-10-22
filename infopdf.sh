#!/bin/bash

if [ $# != 1 ] || [ ! -d $1 ]; then
  echo 'Usage: infopdf <root-directory>'
  echo
  echo 'Recursively lists metadata sections of pdf files if present (see pdfinfo) starting from <root-directory>.'
  echo 'Sections contained are:'
  echo '  - Title'
  echo '  - Subject'
  echo '  - Author'
  echo '  - CreationDate'
  echo '  - Pages'
  echo
	exit
fi

shopt -s globstar
for file in $1/**/*.pdf; do
  [ -e "$file" ] || continue
  echo found "$file";
  pdfinfo "$file" | egrep "Title|Subject|Author|Pages|CreationDate";
  echo
done
