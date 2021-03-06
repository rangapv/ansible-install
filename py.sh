#!/bin/bash

set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1
source <(curl -s https://raw.githubusercontent.com/rangapv/ansible-install/main/pyverchk.sh) >/dev/null 2>&1
source <(curl -s https://raw.githubusercontent.com/rangapv/ansible-install/main/libraries.sh) >/dev/null 2>&1
source <(curl -s https://raw.githubusercontent.com/rangapv/ansible-install/main/pipst.sh) >/dev/null 2>&1

pyupgrade() {
pargs="$#"
args=("$@")
arg1=${args[$((pargs-1))]}
pyver=${args[$((pargs-pargs))]}
pyver2=${args[$((pargs-$((pargs-1))))]}
pyver3=${args[$((pargs-$((pargs-2))))]}
var3="/"
wg=$pyver$pyver2$var3$pyver3
sudo wget "$wg" 
tar xzf $pyver3
se1=$( echo "${pyver3}" | awk '{split($0,a,".");print a[1]"."a[2]"."a[3]}')
se2=$( echo "${pyver3}" | awk '{split($0,a,".");print a[1]"."a[2]}')
se3=$( echo "${pyver2}" | awk '{split($0,a,".");print a[1]"."a[2]}')
cd $se1 
sudo ./configure --enable-optimizations
sudo make altinstall
slpy="python${se3}"
pyuni="${slpy}"
wchpyuni=`which ${slpy}`
wchpyth=`which python`
`sudo ln -sf "${wchpyuni}" /usr/bin/python3`
`sudo ln -sf /usr/bin/python3 ${wchpyth}`
}

pipupgrade () {
      pipargs="$#"
      pargs=("$@")
      pargs1=${pargs[$((pipargs-pipargs))]}
      pyvercheck python

      if [[ ( $pargs -eq 0 ) ]]
      then
	 sudo $pargs1 install -y python-pip
         sudo pip install --upgrade pip
	 piprelease
	 pipup
      elif [[ ( $pargs = 3 ) ]]
      then
         sudo $pargs1 install -y python3-pip
	 sudo pip3 install --upgrade pip
	 piprelease 3
	 pipup 3
      elif (( $(echo $pargs ${piver112} | awk '{if ($1 = $2) print 1;}') )); 
      then
	      piprelease ${piver112}
	      pipup ${piver112}
      else
	 echo "This should not happen"
      fi
}


pip21() {
        pip21arg1="$#"
	pip21arg2="$@"
	
 	pipupgrade $pip21arg2
             declare -i pipver1
             pyvercheck python              
             pipadd="pip3.${piver33}"
	     pipv=$( echo "$pipadd --version")
             pipret=$( echo "$?" )
	     pipver1=100
	     if [[ $pipret < 1 ]]
             then
	     pipver=$( echo "$pipv" | awk '{split($0,a," ");print a[2]}')
             pipver1=$( echo "$pipver" | awk '{split($0,a,".");print a[1]}')
             fi 
  
	     if (( $pipver1 < 21 || $pipret != 0 )) 
             then
                eval "sudo $cm1 install -y wget"
                eval "wget https://bootstrap.pypa.io/get-pip.py -O ./get-pip.py"
                eval "sudo python3 ./get-pip.py"
             else
              echo "pipver is >21"
             fi
}


#

pythoninstalls() {

        pyv=`which python`
	pyvs="$?"
	if [[ ( $pyvs -ne 0 ) ]]
	then
		sudo $cm1 -y install python
	        pip21
                pyupgrade https://www.python.org/ftp/python/ "3.6.12" "Python-3.6.12.tgz" 
                lbrelease
		pyvercheck python
	        pip21 3
		pip21 ${piver112}
        fi 
	pyvercheck python
	if [[ ( $piver1 <  $cmd1 ) ]]
	then
		echo "Upgrading Python to version $cmd1"	
                pyupgrade https://www.python.org/ftp/python/ $cmd1 $cmd2
	        lbrelease
		pyvercheck python
        	pip21 ${piver112}
	fi
}

sethelp() {
	echo "Usage: ./py.sh 3.8.0 Python-3.8.0.tgz "
	echo "       First-argument is this script executable"
	echo "       Second-argument is the Python version 3.8.x "
        echo "       Third-argument is the Python tar file name Python-3.8.x.tgz (check website for specific https://www.python.org/ftp/python/) "
        echo "       If \"NO\" second and third argument given then defaults to version set in the script"
	echo "        *******     "
	echo "Display Help: ./py.sh -h    " 
        echo " "
}

# Function declaration ends


while getopts ":h" option; do
   case $option in
      h) # display Help
         sethelp 
         exit;;
   esac
done

if [[ ( "$#" -eq 0 ) ]]
then
	#set -- "3.10.0" "Python-3.10.0a6.tgz"
	set -- "3.9.4" "Python-3.9.4.tgz"
	#set -- "3.8.7" "Python-3.8.7.tgz"
	#set -- "3.7.9" "Python-3.7.9.tgz"
	#set -- "3.6.12" "Python-3.6.12.tgz" 

fi
   cmd1=$1
   cmd2=$2
   piver1=0
   pyvercheck python

   if [[ (( $piver1 > $cmd1 )) ]]
   then
     echo "Current version is higher than the requested...hence aborting"
     exit
   elif [[ (( $piver1 = $cmd1 )) ]]
   then
     echo "Current version is same as the requested...hence aborting"
   exit
   fi

if [ $(echo "$li" | grep Linux) ]
then
  mac=""
else
  mac=$(sw_vers | grep Mac)
fi

if [ -z "$mac" ]
then

count=0

if [ ! -z "$u1" ]
then 
	mi=$(lsb_release -cs)
	lsb=$(echo "$?")
	if [[ ( $lsb > 0 ) ]]
        then
		lbrelease
	fi
	mi2="${mi,,}"
	ji=$(cat /etc/*-release | grep DISTRIB_ID | awk '{split($0,a,"=");print a[2]}')
	ki="${ji,,}"
	pythoncurrent
	if [ "$ki" = "ubuntu" ]
	then
   	echo "IT IS UBUNTU"
   	cm1="apt-get"
        cm11="add-apt-repository"
   	cm2="apt-key"
        sudo $cm11 -y ppa:deadsnakes/ppa
        sudo ln -sf /usr/lib/python3/dist-packages/apt_pkg.cpython-38-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so
        sudo $cm1 -y install gcc make wget libffi-dev
	sudo $cm1 -y update
	sudo $cm1 -y upgrade
	zlibadd
	sslupdate $cm1 
        packages $cm1
	pythoninstalls
	count=1
	fi
elif [ ! -z "$d1" ]
then
	mi=$(lsb_release -cs)
	lsb=$(echo "$?")
	if [[ ( $lsb > 0 ) ]]
        then
		lbrelease
	fi
	mi2="${mi,,}"
	ji=$(cat /etc/*-release | grep ^ID= | grep -v "\"" | awk '{split($0,a,"=");print a[2]}')
	ki="${ji,,}"
	if [ "$ki" = "debian" ]
	then
	echo "IT IS Debian"
	cm1="apt-get"
	cm2="apt-key"
	sudo $cm1 -y update
	sudo $cm1 -y upgrade
	sudo $cm1 -y install gcc make wget libffi-dev 
	zlibadd
	sslupdate $cm1 
	packages $cm1
	pyupgrade https://www.python.org/ftp/python/ $1 $2 
	lbrelease
	count=1
	pip21
	pipup
        fi

elif [ ! -z "$f1" ]
then
	ji=$(cat /etc/*-release | grep '^ID=' |awk '{split($0,a,"\"");print a[2]}')
        ki="${ji,,}"
        if [ $ki = "fedora" ]
        then
        echo " it is fedora"
        cm1="dnf"
        sudo $cm1 -y install gcc make openssl-devel bzip2-devel libffi-devel zlib-devel wget
	packages $cm1
	count=1
        fi
elif [ ! -z "$s1" ]
then
	ji=$(cat /etc/*-release | grep '^ID=' |awk '{split($0,a,"\"");print a[2]}')
        ki="${ji,,}"
        if [ $ki = "sles" ]
        then
        echo " it is SUSE"
        sudo zypper install -y gcc make openssl-devel libffi-devel zlib-devel wget lsb-release
	packages $cm1
	count=1
        fi
elif [ ! -z "$fc1" ]
then
	ji=$(cat /etc/*-release | grep '^ID=' |awk '{split($0,a,"\"");print a[2]}')
        ki="${ji,,}"
        if [ $ki = "flatcar" ]
        then
          echo "It is Flat Car Linux"
        fi
	count=0

elif [[ ! -z "$c1" || ! -z "$r1" || ! -z "$a1" ]]
then
	mi=$(lsb_release -cs)
	lsb=$(echo "$?")
	if [[ ( $lsb > 0 ) ]]
        then
		lsbrelease
	fi
        ji=$(cat /etc/*-release | grep '^ID=' |awk '{split($0,a,"\"");print a[2]}')
        ki="${ji,,}"
	if [ $ki = "amzn" ]
	then
	   echo "It is amazon AMI"
	   count=1
	elif [ $ki = "rhel" ]
	then 
	   echo "It is RHEL"
	   count=1
	elif [ $ki = "centos" ]
	then
	   echo "It is centos"
           count=1
	else
	   echo "OS flavor cant be determined"
	fi
#        yummy
        cyum=0
        if [[ ( ! -z "$c1" ) ]]
        then
          yummy
        cm1="yum"
        link=$(readlink -f `which /usr/bin/python`)
	sudo ln -sf /usr/bin/python2 /usr/bin/python
        cyum=1
         fi

        cm1="yum"
	sudo $cm1 -y update
        sudo $cm1 -y install wget
	sudo $cm1 -y install gcc make openssl-devel bzip2-devel libffi-devel zlib-devel wget
        sudo $cm1 -y install @development
        if [[ ( $cyum -eq 1 ) ]]
        then
          sudo ln -sf $link /usr/bin/python 
        fi
        pyupgrade https://www.python.org/ftp/python/ $1 $2 
        count=1
	pip21
        pipup
elif [ ! -z "$mac" ]
then
	echo "It is a Mac"
	cm1="brew"
	count=1
else
	echo "The distribution cannot be determined"
fi
pi=$(python --version)
ret=$( echo "$?")
#echo `${newpip} -V`
else 
  echo "Mac is not empty"
fi
