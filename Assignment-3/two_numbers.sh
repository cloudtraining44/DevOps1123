#!/bin/bash

echo "enter any number"
read n
if [[($n == 15 || $n == 45)]]
then
echo "you won the game"
else
echo "you lost the game"
fi
