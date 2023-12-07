#!/bin/bash
echo "enter the full name"
read fullname
echo "you entered: $fullname"

echo "enter the address"
read address
echo "you entered: $address"

name_address="$fullname $address"

echo "Full Name & Address: $name_address"
