#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "show error please run with root acess"
    exit 1
else
    echo "running with root access"
fi