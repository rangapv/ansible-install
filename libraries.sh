#!/bin/bash
set -E

sslupdate() {

cm1="$@"
sslver1="3.0.10"
sudo $cm1 -y install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev bzip2* libc6-dev libbz2-dev
curl https://www.openssl.org/source/openssl-$sslver1.tar.gz | tar xz
cd openssl-$sslver1 
sudo ./config shared --prefix=/usr/local
sudo make
sudo make install

}

susepyup(){
sudo zypper -y install git

}


zlibadd() {

	zlib="zlib-1.3"
	sudo wget http://www.zlib.net/$zlib.tar.gz 
        tar -xzf ./$zlib.tar.gz
        cd $zlib 
        sudo make distclean
        sudo ./configure
        sudo make
        sudo make install
        ld1=`cat $HOME/.bashrc | grep "export LDFLAGS="`
        if [[ ( ! -z "$ld1" ) ]]
	then
	echo "export LDFLAGS=${LDFLAGS} -L/usr/local/lib" >> ~/.bashrc  
        fi
       	ld2=`cat $HOME/.bashrc | grep "export CPPFLAGS="`
	if [[ ( ! -z "$ld2" ) ]]
	then
	echo "export CPPFLAGS=${CPPFLAGS} -I/usr/local/include" >> ~/.bashrc
    	fi
    	ld3=`cat $HOME/.bashrc | grep "export PKG_CONFIG_PATH="`
        if [[ ( ! -z "$ld3" ) ]]
	then
	echo "export PKG_CONFIG_PATH=${PKG_CONFIG_PATH} /usr/local/lib/pkgconfig" >> ~/.bashrc
	fi

}



chkpython() {

chkp1=`which python`
chkp1s="$?"

if [[ ( $chkp1s = "0" ) ]]
then
   chkp="python"
fi

chkp2=`which python3`
chkp2s="$?"

if [[ ( $chkp2s = "0" ) ]]
then
   chkp="python3"
fi

}

lbrelease() {
file1="/usr/bin/lsb_release"
chkpython
pyvercheck $chkp 

line1="#!${wchpy}"
sudo sed -i "1s|^.*|${line1}|" $file1

sudo ln -s /usr/share/pyshared/lsb_release.py /usr/local/lib/python${pyvert}/site-packages/lsb_release.py
}

packages() {

sudo $cm1 install -y libncurses-dev libgdbm-dev libz-dev tk-dev libsqlite3-dev libreadline-dev liblzma-dev libffi-dev libssl-dev

}

lsbrelease() {
ryumck=0
if [[ ( ! -z $c1 ) || ( ! -z $r1 ) || ( ! -z $a1 ) ]]
then
	
chkpython	
ryum=`which $chkp`
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


