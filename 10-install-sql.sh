#!/bin/bash

USRID=$(id -u)

if [ $USRID -ne 0 ]
then
    echo "Not a Root User"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Fail"
        exit 1
    else
        echo "Success"
    fi
else
    echo "Already Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "fail"
        exit 1
    else
        echo "success"
    fi
else
    echo "already installed"
fi
