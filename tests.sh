#!/bin/bash

#cmd params
echo First: $1 #first param
echo All: $@ #all params
echo Count: $# #number params

#variables
v=variable
d=/dir/somedir
longvar='(this is one variable)' #quotes mark one item
longvar2="($longvar but even longer)" #the " allows for substitutions
notlong='$longvar2'
echo Variables: $v $d
echo $longvar
echo $longvar2
echo $notlong

#command substitution
checkdir=$HOME/Downloads
countvar=$( ls $checkdir | wc -l )
echo number files in $checkdir: $countvar

#skipping variable exporting for now
