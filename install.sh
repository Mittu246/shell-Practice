#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "script started and executed at: $(date)


if [ $USERID -ne 0 ]
then
    echo "show error please run with root acess" &>>$LOG_FILE
    exit 1
else
    echo "running with root access" &>>$LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
   echo "my $2 install is success" &>>$LOG_FILE
else
   echo "my $2 install is not sucess" &>>$LOG_FILE
   exit 1
fi

}
dnf list installed mysql &>>$LOG_FILE
# check already installed or not .if installed $? is 0, then
# if $? is 1 else
if [ $? -ne 0 ]
then
   echo "mysql is going to install " &>>$LOG_FILE
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "sql"
else
   echo "my sql is already insatlled..nothing to do it" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
   echo "nginx is going to intsall" &>>$LOG_FILE
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "nginx"
else
   echo "nginx is alreasdy installed...nothing to do it" &>>$LOG_FILE
fi
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ] 
then
   echo "python3 is going to install" &>>$LOG_FILE
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "python3"
else
    echo "python3 is already installed" &>>$LOG_FILE
fi
