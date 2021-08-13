#!/usr/bin/bash

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
`sudo ln -sf "/usr/local/bin/${slpy}" /usr/bin/python`
`sudo ln -sf "/usr/local/bin/${slpy}" /usr/bin/python3`
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

      if [ $piver12 = "2" ]
      then
	 sudo $pargs1 install -y python-pip
         sudo pip install --upgrade pip
	 piprelease
      elif [ $piver12 = "3" ]
      then
         sudo $pargs1 install -y python3-pip
	 sudo pip3 install --upgrade pip
	 piprelease 3
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

line1="#!/usr/local/bin/python${pyvert}"
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
pipupgrade $cm1
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
	      piver=$(python -V 2>&1)
              piverec=$(echo "$?")
	      piver34=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
	      piverwh=$(which python)
	      piverwhec=$(echo "$?")
              pyvercheck python 
	      if [[ ( ! -z "$u1" || ! -z "$d1" ) && ( $piver34 = "6" ) && ( $piverwhec < 1) && ($piverec < 1) ]]
              then
              eval "sudo ln -sf /usr/local/bin/python3.6 /usr/bin/python3"
              eval "sudo ln -sf /usr/bin/python3 /usr/bin/python"
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
              eval "sudo $cm1 install -y python3-pip"
              eval "pip install --upgrade pip"
              eval "pip install awscli"
              eval "pip install boto"
              eval "pip install boto3"
              eval "sudo $cm1 install -y python-boto"
              eval "sudo $cm1 install -y python-boto3"
	      if [[ ( $cyum -eq 1 ) ]]
              then
              sudo ln -sf $link /usr/bin/python
              fi
              else     
	      eval "sudo $cm1 install -y python3-pip"
	      eval "pip3.${piver33} install --upgrade pip"
              eval "pip3.${piver33} install awscli"
              eval "pip3.${piver33} install boto"
              eval "pip3.${piver33} install boto3"
              eval "sudo $cm1 install -y python-boto"
              eval "sudo $cm1 install -y python-boto3"
	      fi
              echo "Success"
              
              pipver=$( echo "pip -V")
              pipech=$( echo "$?" )
              if [ $pipech > 0 ]
              then
                   piprelease
              fi
              piprelease
              piprelease 3
              nw="pip3"
              ne="."
              newpip="${nw}${ne}${piver33}"
              piprelease "${piver12}${ne}${piver33}"
              echo `${newpip} -V`
}

piprelease() {
pargs="$#"
args=("$@")
#args2=${args[$((pargs-1))]}
args1=${args[$((pargs-pargs))]}
newpip="pip${args1}"
file2=$( echo `which ${newpip}`)

if [[ ( $pargs -eq 0 ) ]]
then
zepip=`which python3`
zepips="$?"
    if [[ ( $zepips -eq 0 ) ]]
    then
      file1="/usr/local/bin/pip"
      line1="#!${zepip}"
    else
      file1="/usr/local/bin/pip"
      line1="#!/usr/local/bin/${pyuni}"
    fi
else
pyvercheck python3
#line1="#!/usr/local/bin/python3"
lpy=`which python${piver112}`
line1="#!${lpy}"
file1="/usr/local/bin/${newpip}"
fi

sudo sed -i "1s|^.*|${line1}|g" $file1
sudo sed -i "1s|^.*|${line1}|g" $file2
line21="from pip._internal.cli.main import main"
line22="from pip._internal import main"
sudo sed -i "s|${line22}|${line21}|g" $file1
sudo sed -i "s|${line22}|${line21}|g" $file2
file3="/usr/local/bin/pip"

if [[ ! -z $c1 || ! -z $r1 || ! -z $s1 ]]
then
 line41="from pip._internal.cli.main import main"
 line31="from pip._internal import main"
 sudo sed -i "s|${line31}|${line41}|g" $file3
#else
# line31="from pip._internal.cli.main import main"
# line41="from pip._internal import main"
# sudo sed -i "s|${line31}|${line41}|g" $file3
fi

if [[ $piver112 = "3.6" && -z $c1 && -z $r1 ]]
then
 sudo sed -i "1s|^.*|${line1}|" $file2 
 line3="from pip._internal.cli.main import main"
 line4="from pip._internal import main"
 sudo sed -i "s|${line3}|${line4}|g" $file2
elif [[ $piver112 = "3.6" &&  ( ! -z $c1 || ! -z $r1 ) ]]
then
 sudo sed -i "1s|^.*|${line1}|" $file2 
 line4="from pip._internal.cli.main import main"
 line3="from pip._internal import main"
 sudo sed -i "s|${line3}|${line4}|g" $file2
fi

}

pyvercheck() {
args2="$@"

piver=$(${args2[@]} -V 2>&1)
piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}') ## Strips the python prefix eg... 3.9.4 etc
piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}') ## Strips the version suffix leaving only the higer order version 2/3 etc.."
piver112=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }') ## Leaves the first two vrsion info and strips the last number eg...3.9
piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}') ## Dispalys the middle version number 9 in Python 3.9.4
pyvert=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }')

}


# Function declaration ends
sethelp() {

	echo "Usage: ./py.sh 3.8.0 Python-3.8.0.tgz "
	echo "       First-argument is this script executable"
	echo "       Second-argument is the Python version 3.8.x "
        echo "       Third-argument is the Python tar file name Python-3.8.x.tgz (check website for specific https://www.python.org/ftp/python/) "
        echo "       If \"NO\" second and third argument given then defaults to version set in the script"
}

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
	zlibadd
	sslupdate $cm1 
	pyupgrade https://www.python.org/ftp/python/ $1 $2
        lbrelease
	count=1
	pip21
	pipup
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
