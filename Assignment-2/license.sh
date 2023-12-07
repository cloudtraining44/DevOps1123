#!/bin/bash
echo "enter the age"
read age
if [ $age -gt 18 ]; then
	echo "you are old enough to drive in most places"
fi
