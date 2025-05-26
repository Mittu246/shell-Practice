#!bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "given $NUMBER is greater than 10"
else
    echo "given $NUMBER is not greater than 10"
fi