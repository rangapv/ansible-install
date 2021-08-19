#!/bin/bash

set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1
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

sslupdate() {
cm1="$@"
sudo $cm1 -y install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
curl https://www.openssl.org/source/openssl-1.0.2o.tar.gz | tar xz
cd openssl-1.0.2o
sudo ./config shared --prefix=/usr/local
sudo make
sudo make install
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
      elif [[ ( $pargs -eq 3 ) ]]
      then
         sudo $pargs1 install -y python3-pip
	 sudo pip3 install --upgrade pip
	 piprelease 3
	 pipup 3
      else
	 echo "This should not happen"
      fi
}

susepyup(){
sudo zypper -y install git

} 

zlibadd() {
	sudo wget http://www.zlib.net/zlib-1.2.11.tar.gz 
        tar -xzf ./zlib-1.2.11.tar.gz
        cd zlib-1.2.11
        sudo make distclean
        sudo ./configure
        sudo make
        sudo make install
}

lbrelease() {
file1="/usr/bin/lsb_release"
pyvercheck python

line1="#!${wchpy}"
sudo sed -i "1s|^.*|${line1}|" $file1 

sudo ln -s /usr/share/pyshared/lsb_release.py /usr/local/lib/python${pyvert}/site-packages/lsb_release.py
}



lsbrelease() {
ryumck=0
if [[ ( ! -z $c1 ) || ( ! -z $r1 ) || ( ! -z $a1 ) ]]
then	
ryum=`which python`
ryums="$?"
if [[ ( $ryums -eq 0 ) ]]
then
link=$(readlink -f `which /usr/bin/python`)
sudo ln -sf /usr/bin/python2 /usr/bin/python
ryumck=1
fi
if [[ ! -z $c1 ]]
then
sudo yum -y install redhat-lsb-core-4.1-27.el7.centos.1.x86_64
fi
if [[ ! -z $r1 ]]
then
 rr=`cat /etc/*-release | grep VERSION_ID= | awk '{split($0,a,"=\""); print a[2]}' | awk '{split($0,a,"."); print a[1]}'`
  if [[ ( $rr -eq 8 ) ]]
  then
  #sudo yum whatprovides redhat-lsb-core
  sudo yum -y install redhat-lsb-core-4.1-47.el8.i686
  elif [[ ( $rr -eq 7 ) ]]
  then
  sudo yum -y install redhat-lsb-core-4.1-27.el7.x86_64 
  fi
fi
if [[ ! -z $a1 ]]
then
sudo yum -y install system-lsb-core-4.1-27.amzn2.1.x86_64
fi
 if [[ ( $ryumck -eq 1 ) ]]
 then
 line10="#!/usr/bin/python2"
 file11="/usr/libexec/urlgrabber-ext-down"
 sudo sed -i "1s|^.*|${line10}|" $file11 
 fi
fi
if [[ ( ! -z $u1 ) ]]
then
sudo apt-get -y install lsb-core 
fi

}

yummy() {
filey="/usr/bin/yum"
yum1="#!/usr/bin/python"
sudo sed -i "1s|^.*|${yum1}|" $filey
filez="/bin/yum"
sudo sed -i "1s|^.*|${yum1}|" $filez
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
          #    echo "eval $(declare -p pipver1)"
          #    echo "the value of pipver is $pipver1"
  
	     if (( $pipver1 < 21 || $pipret != 0 )) 
             then
                eval "sudo $cm1 install -y wget"
                eval "wget https://bootstrap.pypa.io/get-pip.py -O ./get-pip.py"
                eval "sudo python3 ./get-pip.py"
             else
              echo "pipver is >21"
             fi
}

pipup() {
	     
          pipuparg1="$#"
          pipuparg2="$@"	  
	  pipflag=0
	  piver=$(python -V 2>&1)
              piverec=$(echo "$?")
	      piver34=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
	      piverwh=$(which python)
	      piverwhec=$(echo "$?")
	      if [[ ( $pipuparg2 -eq 0 ) ]]
	      then 
	             pyvercheck python 
                     pipflag=1 
	      else
		      pyvercheck python${pipuparg2}
	      fi
	         if [[ ! -z "$c1" || ! -z "$r1" || ! -z "$a1" ]]
	         then
                  cyum=0
                    if [[ ( ! -z "$c1" ) ]]
                    then
                      link=$(readlink -f `which /usr/bin/python`)
                      sudo ln -sf /usr/bin/python2 /usr/bin/python
                      cyum=1
                    fi
	          fi    
              if [[ ( $pipflag -eq 1 ) ]]
              then
                  pipaddons pip
	      else
		  pipaddons pip${pipuparg2}
	      fi
	         if [[ ( $cyum -eq 1 ) ]]
                 then
                  sudo ln -sf $link /usr/bin/python
                 fi
              echo "Success"
              
              pipver=$( echo "pip -V")
              pipech=$( echo "$?" )
              if [ $pipech > 0 ]
              then
                   piprelease
              fi
              nw="pip3"
              ne="."
              newpip="${nw}${ne}${piver33}"
	      echo `${newpip} -V`
}

piprelease() {
pargs="$#"
args=("$@")
#args2=${args[$((pargs-1))]}
args1=${args[$((pargs-pargs))]}
newpip="pip${args1}"
file2=`which ${newpip}`
file2s="$?"

if [[ ( $pargs -eq 0 ) ]]
then
pyvercheck python
      file1=`which pip`
      file1s="$?"
      line1="#!${wchpy}"
else
pyvercheck python3
#line1="#!/usr/local/bin/python3"
     lpy=`which python${piver112}`
     line1="#!${lpy}"
     file1=`which ${newpip}`
     file1s="$?"
fi

line21="from pip._internal.cli.main import main"
line22="from pip._internal import main"

if [[ ( $file2s -eq 0 ) ]]
then
sudo sed -i "1s|^.*|${line1}|g" $file2
sudo sed -i "s|${line22}|${line21}|g" $file2
fi

if [[ ( $file1s -eq 0 ) ]]
then
sudo sed -i "1s|^.*|${line1}|g" $file1
sudo sed -i "s|${line22}|${line21}|g" $file1
fi

file3=`which pip`
file3s="$?"

if [[ ! -z $c1 || ! -z $r1 || ! -z $s1 ]]
then
 line41="from pip._internal.cli.main import main"
 line31="from pip._internal import main"
 if [[ ( $file3s -eq 0 ) ]]
 then
 sudo sed -i "s|${line31}|${line41}|g" $file3
 fi
#else
# line31="from pip._internal.cli.main import main"
# line41="from pip._internal import main"
# sudo sed -i "s|${line31}|${line41}|g" $file3
fi

if [[ $piver112 = "3.6" && -z $c1 && -z $r1 ]]
then
	if [[ ( $file2s -eq 0 ) ]]
	then
           sudo sed -i "1s|^.*|${line1}|" $file2 
           line3="from pip._internal.cli.main import main"
           line4="from pip._internal import main"
           sudo sed -i "s|${line4}|${line3}|g" $file2
        fi
elif [[ $piver112 = "3.6" &&  ( ! -z $c1 || ! -z $r1 ) ]]
then
	if [[ ( $file2s -eq 0 ) ]]
	then
           sudo sed -i "1s|^.*|${line1}|" $file2 
           line4="from pip._internal.cli.main import main"
           line3="from pip._internal import main"
           sudo sed -i "s|${line3}|${line4}|g" $file2
        fi
fi

}

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

pipaddons() {
argpipadd="$@"

              eval "${argpipadd[@]} install --upgrade pip"
              eval "${argpipadd[@]} install awscli"
              eval "${argpipadd[@]} install boto"
              eval "${argpipadd[@]} install boto3"
              eval "$cm1 install -y python-boto"
              eval "$cm1 install -y python-boto3"
}

sethelp() {
	echo "Usage: ./py.sh 3.8.0 Python-3.8.0.tgz "
	echo "       First-argument is this script executable"
	echo "       Second-argument is the Python version 3.8.x "
        echo "       Third-argument is the Python tar file name Python-3.8.x.tgz (check website for specific https://www.python.org/ftp/python/) "
        echo "       If \"NO\" second and third argument given then defaults to version set in the script"
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
	#set -- "3.9.4" "Python-3.9.4.tgz"
	set -- "3.8.7" "Python-3.8.7.tgz"
	#set -- "3.7.9" "Python-3.7.9.tgz"
	#set -- "3.6.12" "Python-3.6.12.tgz" 

fi

   pyvercheck python3

   if [[ ( "$piver1" = "$1" ) ]]
   then
      echo "Requirement Satisifed nothing to upgrade or install"
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
	pyvercheck python
        if [[ ( $pyver1 -eq $1 ) ]]
        then
                echo "Requirement satisfied Python is already in version $pyver1"
                exit
	fi	
	if [ "$ki" = "ubuntu" ]
	then
   	echo "IT IS UBUNTU"
   	cm1="apt-get"
        cm11="add-apt-repository"
   	cm2="apt-key"
        sudo $cm11 -y ppa:deadsnakes/ppa
        sudo ln -sf /usr/lib/python3/dist-packages/apt_pkg.cpython-38-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so
        sudo $cm1 -y install gcc make wget
	sudo $cm1 -y update
	sudo $cm1 -y upgrade
	zlibadd
	sslupdate $cm1 
        pyv=`which python`
	pyvs="$?"
	if [[ ( $pyvs -ne 0 ) ]]
	then
		sudo $cm1 -y install python
	        pip21
                pyupgrade https://www.python.org/ftp/python/ "3.6.12" "Python-3.6.12.tgz" 
                lbrelease
	        pip21 3
		pyvercheck python
		pip21 ${piver112}
        fi 
	pyvercheck python
        if [[ ( $pyver1 -eq $1 ) ]]
	then
		echo "Requirement satisfied Python is already in version $pyver1"
	else 
                pyupgrade https://www.python.org/ftp/python/ $1 $2
	        lbrelease
		pyvercheck python
        	pip21 ${piver112}
	fi
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
