#!/bin/bash

USRID=$(id -u)


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 IS Fail"
        exit 1
    else
        echo "$2 Is Success"
    fi
}

if [ $USRID -ne 0 ]
then
    echo "Not a Root User"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "Already Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "GIT"
else
    echo "already installed"
fi
