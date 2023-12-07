#!/bin/bash


echo "enter the first number"
read num1
echo "you entered: $num1"

echo "enter the second number"
read num2
echo "you entered: $num2"

(( sum=num1+num2 ))
echo "the result of addition: $sum"

