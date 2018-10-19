#!/bin/bash

function goodbye {
  echo 'Usage: ./retitler.sh <entry point dir for pdf search>'
  exit
}

if [ $# != 1 ] || [ ! -d $1 ]
then
  goodbye
fi

for file in $( find $1 -name *.pdf )
do
  prefix=${file%/*} #gets the prefix
  old_base=${file##*/} #gets the suffix
  new_base=$( pdfinfo $file | grep Title | sed 's/Title:[[:space:]]*//' | sed 's/[[:space:]]/_/g' ) #obtains metadata from pdf
  new_base=${new_base%.pdf} #remove .pdf suffix if in metadatas title
  new_name=$prefix/$new_base.pdf
  if [ -e $new_name ]
  then
    echo WARNING: FILE ALREADY EXISTS: skipping $file, because $new_name already exists!
    continue
  elif [ -z $new_base ]
  then
    echo WARNING: NO TITLE: skipping $file, because there was no Title metadata!
    continue
  else
    echo renaming $file to $new_name
    mv $file $new_name
  fi
done
