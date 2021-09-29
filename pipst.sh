#!/bin/bash
set -E

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

pipaddons() {
argpipadd="$@"
              eval "${argpipadd[@]} install --upgrade pip"
              eval "${argpipadd[@]} install awscli"
              eval "${argpipadd[@]} install boto"
              eval "${argpipadd[@]} install boto3"
              eval "$cm1 install -y python-boto"
              eval "$cm1 install -y python-boto3"
}
