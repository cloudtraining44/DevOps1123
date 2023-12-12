
#!/bin/bash
echo "choose between pizza,burger or pasta"
read Food
if [$Food = "pizza"];then
	echo "you seem to like pizza shell."
elif [$Food ="burger"];
	echo "you seem to like burger shell."
elif[$Food ="pasta"];then
	echo "you seem to like pasta shell."
else 
	echo "you dont seem to like neither pizza, nor burger or pasta."
fi


