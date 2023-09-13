#!/usr/bin/env bash


pipchk() {

pipck1=`which pip`
pipck1s="$?"
pipck2=`which pip${piver12}`
pipck2s="$?"
pipck3=`which pip${piver112}`
pipck3s="$?"
#echo "1,2 3, is $pipck1 , $pipck2, $pipck3"

}


updatepip() {
pythonwc
pipchk
if [[ ( -z "$pipck1") && ( -z "$pipck2") && ( -z "$pipck3") ]]
then
        if [[ ( ! -z "$pycmdver" ) ]]
	then
	newpipinst=`$pycmdver -m pip install --upgrade pip`
        newpips="$?"
		if [[ ( "$newpips" != 0 ) ]]
		then
			`sudo "$cm1" install -y wget`
               		`wget https://bootstrap.pypa.io/get-pip.py -O ./get-pip.py`
                	`sudo "$pycmdver" ./get-pip.py`
		fi
	fi
fi
pipchk
	if [[ ( -z "$pipck1" ) && ( ! -z "$pipck3" ) ]]
	then
         `sudo ln -sf "$pipck3" "/usr/bin/pip"`
	fi

pipchk
	if [[ ( -z "$pipck2" ) && ( ! -z "$pipck3" ) ]]
	then
         `sudo ln -sf "$pipck3" "/usr/bin/pip${piver12}"`
	fi
}

