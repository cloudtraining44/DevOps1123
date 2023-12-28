#!/bin/bash
num=5
while (( num <= 10 ))
do
	echo $num
	(( num = num + 1 )) # let num=num+1
done

