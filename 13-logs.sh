#!/bin/bash

USRID=$(id -u)

if [ $USRID -ne 0 ]
then
    echo -e " $R Not a Root User"
    exit 1
fi


LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 IS $R Fail $N"
        exit 1
    else
        echo -e "$2 Is $G Success $N"
    fi
}


echo "The Time is : $TIMESTAMP" &>> $LOG_FILE_NAME


dnf list installed mysql  &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql -y  &>>$LOG_FILE_NAME
    VALIDATE $? "MYSQL"
else
    echo -e "Mysql is $Y Already Installed $N"
fi

dnf list installed git  &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "GIT"
else
    echo -e " here it is $Y git already installed $N"
fi
