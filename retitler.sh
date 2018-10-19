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
  prefix=${file%/*}
  old_base=${file##*/}
  new_base=$( pdfinfo $file | grep Title | sed 's/Title:[[:space:]]*//' | sed 's/[[:space:]]/_/g' )
  new_base=${new_base%.pdf}
  new_name=$prefix/$new_base.pdf
  echo $prefix
  echo $old_base
  echo $new_base
  echo $file
  echo $new_name
  echo 
  if [ -e $new_name ]
  then
    echo skipping $file, because $new_name already exists!
    continue
  elif [ -z $new_base ]
  then
    echo skipping $file, because there was no Title metadata!
    continue
  else
    echo renaming $file to $new_name
    mv $file $new_name
  fi
  
done
