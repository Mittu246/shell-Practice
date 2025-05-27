#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "show error please run with root acess"
    exit 1
else
    echo "running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
   echo "mysql is going to install "
   dnf install mysql -y
   if [ $? -eq 0 ]
then
   echo "my sql install is success"
else
   echo "my sql install is not sucess"
   exit 1
fi
else
   echo "my sql is already insatlled..nothing to do it"
fi