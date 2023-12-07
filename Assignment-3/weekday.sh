#!/bin/bash
i=1
for day in mon tue wed thu fri
do
echo "weekday $((i++)):$day"
if [ $i -eq 5 ]; then
break
fi
done
