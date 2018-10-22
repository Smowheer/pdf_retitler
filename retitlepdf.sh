#!/bin/bash

function goodbye {
  echo 'Usage: retitlepdf [-f] <root-directory>'
  echo
  echo 'Retitling pdfs recursively starting from <root-directory>.'
  echo
  echo 'Options:'
  echo '  -f    force renaming without asking (default: ask)'
  echo
  exit
}

getopts "f" opt
[ $opt = f ] && shift 1

if [ $# != 1 ] || [ ! -d $1 ]
then
  goodbye
fi

shopt -s globstar
for file in $1/**/*.pdf
do
  [ -e "$file" ] || continue
  prefix=${file%/*} #gets the prefix
  old_base=${file##*/} #gets the suffix
  new_base=$( pdfinfo "$file" | grep Title | sed 's/Title:[[:space:]]*//' ) #obtains metadata from pdf
  new_base=${new_base%.pdf} #remove .pdf suffix if in metadatas title
  new_base="$new_base".pdf
  new_name="$prefix"/"$new_base"
  echo FILE: "$file"
  if [ -e "$new_name" ]
  then
    echo WARNING: "$new_base" already exists! skipping
    continue
  elif [ -z "$new_base" ]
  then
    echo WARNING: "$old_base" has no title! skipping
    continue
  elif [ $opt = f ]
  then
    echo renaming "$old_base" to "$new_base"
    mv "$file" "$new_name"
  else
    read -r -p "rename '$old_base' to '$new_base' (y/n)?"
    case "$REPLY" in
      [Yy]*|"") mv "$file" "$new_name"
        ;;
      *)
        ;;
    esac
  fi
done
