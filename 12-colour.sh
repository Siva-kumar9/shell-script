#!/bin/bash

USRID=$(id -u)

if [ $USRID -ne 0 ]
then
    echo -e " $R Not a Root User"
    exit 1
fi


R="\e[31m"
G="\e[32m"
Y="\e[33m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 IS $R Fail"
        exit 1
    else
        echo -e "$2 Is $G Success"
    fi
}



dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "$Y Already Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "GIT"
else
    echo -e " $Y already installed"
fi
