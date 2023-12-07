#!/bin/bash
echo "the age for driving license"
read AGE
if [ $AGE -ge "18" ];then
   echo "the driver is eligible to drive"
else 
    echo "the driver is not eligible to drive"
fi
