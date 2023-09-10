#!/usr/bin/env bash
set -E

pyvercheck() {
args2="$@"
lenarg="$#"
#echo "lenarg is $lenarg"
len1=$((lenarg-lenarg))
len2=$((lenarg-1))
piver=$(${args2[$len1]} -V 2>&1)
piversc="$?"
#echo "len1 is $len1 len2 is $len2 and arg is ${args2[$len1]}"
if [[ ( $piversc -eq 0 ) ]]
then
wchpy=`which ${args2[$len1]}`
piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}') ## Strips the python prefix eg... 3.9.4 etc
piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}') ## Strips the version suffix leaving only the higer order version 2/3 etc.."
piver112=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }') ## Leaves the first two vrsion info and strips the last number eg...3.9
piver35=$( echo "${piver11}" | awk '{l=split($0,a,".");for(i=1;i<l-1;i++) print a[i]"."a[i+1];}')
piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}') ## Dispalys the middle version number 9 in Python 3.9.4
pyvert=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }')
pyuni="python${piver12}"
fi
#echo "piver1 is $piver1 piver12 is $piver12 piver112 $piver112 piver33 is $piver33 pyvert is $pivert pyuni is $pyuni"
}


pythoncurrent() {
     pyv=`which python`
     pyvs="$?"
     if [[ ( $pyvs -ne 0 ) ]]
     then
            echo "No Python Found; GREENFIELD Installs proceeding"
     else
        pyvercheck python
        if [[ ( $piver1 = $cmd1 ) ]]
        then
                echo "Requirement satisfied Python is already in version \"${piver1}\" "
                exit
        elif [[ ( $piver1 < $cmd1 ) ]]
        then
                echo "Upgrading Python to $cmd1"

        elif [[ ( $piver1 > $cmd1 ) ]]
        then
                echo "The current version of Python ${piver1} is Higher than the request $cmd1 ;exiting"
                exit
        fi
     fi
}

