#!/bin/bash

if [ $# != 1 ] || [ ! -d $1 ]; then
  echo 'Usage: ./pdfinfos.sh <directory>'
	exit
fi

for i in $( find $1 -name '*.pdf' ); do
  echo found $i;
  echo ----------;
  pdfinfo $i | egrep "Title|Subject|Author|Pages|CreationDate";
  echo ----------;
done
