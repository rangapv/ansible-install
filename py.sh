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
slpy="python$se3"
sudo ln -sf "/usr/local/bin/$slpy" /usr/bin/python
sudo ln -sf /usr/bin/python /usr/bin/python3
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
      piver=$(python -V 2>&1)
      piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}')
      piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}')
      piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')

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

ansible () {

sudo $cm1 install -y python3-pip
sudo $cm1 install build-essential libssl-dev libffi-dev python-dev -y
sudo $cm1 install selinux-utils
sudo $cm1 install -y policycoreutils
sudo $cm1 install selinux-basics
sudo setenforce 0
sudo $cm1 update
sudo $cm1 install software-properties-common
sudo $cm1 update
sudo -H pip install ansible
ansible --version
ansible -m ping localhost


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
piver=$(python -V 2>&1)
piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}')
piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}')
piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
pyvert=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }')

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
line10="#!/usr/bin/python2"
file11="/usr/libexec/urlgrabber-ext-down"
sudo sed -i "1s|^.*|${line10}|" $file11 
fi
if [[ ( ! -z $u1 ) ]]
then
sudo apt-get -y install lsb-core 
fi

}

yummy() {
ryum=`which python`
ryums="$?"
if [[ ( $ryums -eq 0 ) ]]
then
filey="/usr/bin/yum"
yum1="#!/usr/bin/python2"
sudo sed -i "1s|^.*|${yum1}|" $filey
filez="/bin/yum"
sudo sed -i "1s|^.*|${yum1}|" $filez
fi
}

pip21() {
pipupgrade $cm1
             declare -i pipver1
              
             piver=$(python -V 2>&1)
             piver11=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}')
             piver12=$( echo "${piver11}" | awk '{split($0,a,".");print a[1]}')
             piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
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
pipver=$( echo "pip -V")
	      pipech=$( echo "$?" )
	      if [ $pipech > 0 ]
	      then
		   piprelease
	      fi
	      piprelease 3
	      nw="pip3"
	      ne="."
              newpip="${nw}${ne}${piver33}"
	      piprelease "${piver12}${ne}${piver33}"
 	      echo `${newpip} -V`
}




pipup() {
	      piver=$(python -V 2>&1)
              piverec=$(echo "$?")
	      piver34=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
	      piverwh=$(which python)
	      piverwhec=$(echo "$?")
              piver11=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}')
              piver12=$( echo "${piver11}" | awk '{split($0,a,".");print a[1]}')
              piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
	      if [[ ( ! -z "$u1" || ! -z "$d1" ) && ( $piver34 = "6" ) && ( $piverwhec < 1) && ($piverec < 1) ]]
              then
              eval "sudo ln -sf /usr/local/bin/python3.6 /usr/bin/python3"
              eval "sudo ln -sf /usr/bin/python3 /usr/bin/python"
	      fi
	      if [[ ! -z "$c1" || ! -z "$r1" || ! -z "$a1" ]]
	      then
              link=$(readlink -f `which /usr/bin/python`)
	      sudo ln -sf /usr/bin/python2 /usr/bin/python	     
              eval "sudo $cm1 install -y python3-pip"
              eval "pip install --upgrade pip"
              eval "pip install awscli"
              eval "pip install boto"
              eval "pip install boto3"
              eval "sudo $cm1 install -y python-boto"
              eval "sudo $cm1 install -y python-boto3"
              sudo ln -sf $link /usr/bin/python
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

}

piprelease() {
pargs="$#"
args=("$@")
#args2=${args[$((pargs-1))]}
args1=${args[$((pargs-pargs))]}
newpip="pip${args1}"
file2=$( echo `which ${newpip}`)
piver=$(python -V 2>&1)
piver1=$( echo "${piver}" | awk '{split($0,a," ");print a[2]}')
piver12=$( echo "${piver1}" | awk '{split($0,a,".");print a[1]}')
piver112=$( echo "${piver1}" | awk '{split($0,a,"."); for (i=1; i<2 ; i++) print a[i]"."a[i+1]; }')
piver33=$( echo "${piver}" | awk '{split($0,a,".");print a[2]}')
if [[ $pargs -eq 0 ]]
then
piver112="2"
lpy=`which python${piver112}`
line1="#!$lpy"
else
lpy=`which python${piver112}`
line1="#!$lpy"
fi
file1="/usr/local/bin/pip${args1}"
sudo sed -i "1s|^.*|${line1}|g" $file1
line21="from pip._internal.cli.main import main"
line22="from pip._internal import main"
sudo sed -i "s|${line22}|${line21}|g" $file1

line3="#!/usr/local/bin/python3.6"
file3="/usr/local/bin/pip"
sudo sed -i "1s|^.*|${line3}|" $file3
c1=$(cat /etc/*-release | grep ID= | grep centos)
if [[ ! -z $c1 || ! -z $r1 || ! -z $s1 ]]
then
line41="from pip._internal.cli.main import main"
line31="from pip._internal import main"
else
line31="from pip._internal.cli.main import main"
line41="from pip._internal import main"
fi
sudo sed -i "s|${line31}|${line41}|g" $file3

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
#	zlibadd
#	sslupdate $cm1 
	pyupgrade https://www.python.org/ftp/python/ 3.10.0 Python-3.10.0a6.tgz
	count=1
	pip21 3
	pipup
#        ansible
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
        count=1
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
        yummy
        cm1="yum"
        ryum=`which python`
        ryums="$?"
        ryumchk=0
        if [[ ( $ryums -eq 0 ) ]]
        then
        ryumchk=1
        link=$(readlink -f `which /usr/bin/python`)
	sudo ln -sf /usr/bin/python2 /usr/bin/python
        fi
	sudo $cm1 -y update
        sudo $cm1 -y install wget
	sudo $cm1 -y install gcc make openssl-devel bzip2-devel libffi-devel zlib-devel wget
        sudo $cm1 -y install @development
        pyupgrade https://www.python.org/ftp/python/ 3.10.0 Python-3.10.0a6.tgz
        count=1
	pip21 3
        pipup
#        ansible
        if [[ ( $ryumchk -eq 1 ) ]]
        then
        sudo ln -sf $link /usr/bin/python 
        fi
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
