#!/bin/bash
set -E

pyvercheck() {
args2="$@"

piver=$(${args2[@]} -V 2>&1)
piversc="$?"
if [[ ( $piversc -eq 0 ) ]]
then
wchpy=`which python`
piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}') ## Strips the python prefix eg... 3.9.4 etc
piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}') ## Strips the version suffix leaving only the higer order version 2/3 etc.."
piver112=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }') ## Leaves the first two vrsion info and strips the last number eg...3.9
piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}') ## Dispalys the middle version number 9 in Python 3.9.4
pyvert=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }')
pyuni="python${piver12}"
fi
}
