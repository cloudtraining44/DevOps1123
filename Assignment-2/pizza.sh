#!/bin/bash
echo "choose between pizza,burger or pasta"
read FOOD

if [ $FOOD = "pizza" ]; then
    echo "you seem to like pizza shell"
elif [ $FOOD = "burger" ]; then
    echo "you seem to like burger shell"
elif [ $FOOD = "pasta" ]; then
    echo "you seem to like pasta shell"
else
    echo "you dont seem to like neither pizza, nor burger or pasta."
fi
