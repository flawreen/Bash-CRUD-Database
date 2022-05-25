#!/bin/bash
source ./methods.sh

options='
\n------------------\n
+++++Actions+++++\n
1) View data\n
2) Add data\n
3) Search data\n
4) Update data\n
5) Delete data\n
0) Exit script\n
Type action number'


echo -e $options
read option

until [ $option == 0 ]
do

if [ $option == 1 ]
	then view
fi

if [ $option == 2 ]
	then add
fi

if [ $option == 3 ]
	then search
fi

if [ $option == 4 ]
	then update
fi

if [ $option == 5 ]
	then delete
fi

if [ $option == 0 ]
	then exit
fi

echo "Do you want to print available actions? [y=continue/n=exit]"
read x
if [ $x == 'y' ]
then
	echo -e $options
	read option
else
	option=0
fi

done
