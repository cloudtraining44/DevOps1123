#!/bin/bash

#display all the days of the week
num=1
for days in monday tuesday wednesday thursday friday saturday sunday
do
echo "$num:$days"
((num++))
done
