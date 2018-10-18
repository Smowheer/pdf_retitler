#!/bin/bash

for i in $( find $1 -name '*.pdf' ); do
  echo found $i;
  echo ----------;
  pdfinfo $i;
  echo ----------;
done
