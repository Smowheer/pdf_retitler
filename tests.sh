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
countvar=$( ls $checkdir | wc -l ) #this is the form for command substitution
echo number files in $checkdir: $countvar

#skipping variable exporting for now (makes copies of vars useable in other scripts)

#use "read" for interactive scripts (see man read), or "cat /dev/stdin" for piping stdin
#but usually prefer cmdline arguments

#arithmetic
wrong=5+4
echo $wrong
let correct=5+4
echo $correct
((correct += 1)) #double braces to eval expressions and return result
echo $correct

#if, case
#if [ <some test> ]   #BE CAREFUL THE SPACES AFTER AND BEFORE [,] ARE REQUIRED!!
#then
#	 <commands>
#elif [ <some test> ] || [ <some test 2> ]
#then
#  <commands>
#else
#	 <commands
#fi

#Operator 							Description
#! EXPRESSION 					The EXPRESSION is false.
#-n STRING 							The length of STRING is greater than zero.
#-z STRING 							The lengh of STRING is zero (ie it is empty).
#STRING1 = STRING2 			STRING1 is equal to STRING2
#STRING1 != STRING2 		STRING1 is not equal to STRING2
#INTEGER1 -eq INTEGER2 	INTEGER1 is numerically equal to INTEGER2
#INTEGER1 -gt INTEGER2 	INTEGER1 is numerically greater than INTEGER2
#INTEGER1 -lt INTEGER2 	INTEGER1 is numerically less than INTEGER2
#-d FILE 								FILE exists and is a directory.
#-e FILE 								FILE exists.
#-r FILE 								FILE exists and the read permission is granted.
#-s FILE 								FILE exists and it's size is greater than zero (ie. it is not empty).
#-w FILE 								FILE exists and the write permission is granted.
#-x FILE 								FILE exists and the execute permission is granted.

#while|until loops
#while|until [ <some test> ]
#do
#	 <commands>
#done

#for
#for val in <list>
#do
#  <commands>
#done

#ranges
#for i in {1..5}
#do
#	 <commands>
#done

#also {10..0..2} is possible (10, 8, 6, ...)

#select
#select var in <list>
#do
#  <commands>
#done

#functions
#function do_stuff {
#  <commands>
#}

#'command' keyword for naming functions like 'ls'
#function arguments are given by $1, $2, $3, ... as usual
#all vars are global unless there is a preceeding 'local'

# ${} useful for truncation see man bash /parameter expansion
