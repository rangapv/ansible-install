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


pythonwc() {

   pyverwh=`which python`
   if [[ ( ! -z "$pyverwh" ) ]]
   then
           pycmdver="python"
           pyvercheck $pycmdver
   fi

   pyverwh3=`which python3`
   if [[ ( ! -z "$pyverwh3" ) ]]
   then
           pycmdver="python3"
           pyvercheck $pycmdver
   fi

   if [[ ( -z "$pyverwh" ) && ( -z "$pyverwh3" ) ]]
   then
           echo "No python installation found in this system"
           piver1="0"
   fi

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



pythoninstalv() {

		 while (true)
		 do
		{
		 echo "Pls input the version to upgrade to (available verison are 3.8.7/3.9.4/3.10.9/3.10.12/3.11.4/3.11.5/3.12.0)"

 		read -r inputpyver
         	testinput=`echo "$inputpyver" | grep "^[(0-9)].[(0-9)]"`
                #echo "input testinput is $testinput"
		if [[ ( ! -z "$testinput" ) ]]
	 	then
			break
		fi
		 }
		done

		if [[ ( ! -z "$inputpyver" )  ]]
	 	then
		 #echo "piver33 is $piver33"
		 piver33="$inputpyver"
	 	else
		 piver33="3.8.7"
	 	fi

        case ${inputpyver} in
		3.8.7)
                      cmd2="Python-3.8.7.tgz"
		;;
      	        3.9.4)
                      cmd2="Python-3.9.4.tgz"
	        ;;
	       	3.10.9)
                      cmd2="Python-3.10.9.tgz"
        	;;
		3.10.12)
                      cmd2="Python-3.10.12.tgz"
		;;
		3.11.4)
                      cmd2="Python-3.11.4.tgz"
		;;
		3.11.5)
                      cmd2="Python-3.11.5.tgz"
                ;;
		3.12.0)
                      cmd2="Python-3.12.0a1.tgz"
		;;
                2)
			 echo "Upgrading Python Version 2"
                         cmd2="Python-3.6.12.tgz"
                ;;
           	*)
		        echo "Verison mismatch..."
			echo "Doing Nothing"
	esac
   cmd1="$inputpyver"
   piver1=0

   pythonwc
    #echo "pycmdver is $pycmdver and piver1 is $piver1 and cmd1 is $cmd1"
    cl1=$(echo "$piver1" | awk '{split($0,a,"."); print a[1]"."a[2]}')
    cl2=$(echo "$cmd1" | awk '{split($0,a,"."); print a[1]"."a[2]}')
    echo "cl1 is $cl1 and cl2 is $cl2"
    if ( (( $(echo "$cl1 > $cl2" | bc -l ) )) )
    then
     echo "Current version is higher than the requested...hence aborting"
     exit
    elif ( (( $(echo "$cl1 = $cl2" | bc -l ) )) )
    then
     echo "Current version is same as the requested...hence aborting"
     exit
    fi

}
