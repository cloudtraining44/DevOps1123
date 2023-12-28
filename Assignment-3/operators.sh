#!/bin/bash
echo "enter any number"
read num
if [[ $num > 100 ]] && [[ $num < 200 ]]
then
	echo "the number lies between 100 and 200"
elif [[ $num < 100 ]]; then
	echo "the number is less than 100"
else echo "the number is above 200"
fi

