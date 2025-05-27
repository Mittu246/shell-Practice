#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "show error please run with root acess"
    exit 1
else
    echo "running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
   echo "my $2 install is success"
else
   echo "my $2 install is not sucess"
   exit 1
fi

}
dnf list installed mysql 
# check already installed or not .if installed $? is 0, then
# if $? is 1 else
if [ $? -ne 0 ]
then
   echo "mysql is going to install "
   dnf install mysql -y
   VALIDATE $? "sql"
else
   echo "my sql is already insatlled..nothing to do it"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo "nginx is going to intsall"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo "nginx is alreasdy installed...nothing to do it"
fi
dnf list installed phython3
if [ $? -ne 0 ] 
then
   echo "phython3 is going to install"
   dnf install phython3 -y
   VALIDATE $? "phython3"
else
    echo "phython3 is already installed"
fi
