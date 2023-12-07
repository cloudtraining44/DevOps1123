#!/bin/bash
function greeting(){
str="hello,$name"
echo $str
}
echo "enter your name"
read name

val=$(greeting)
echo  "return value of the function is $val"


