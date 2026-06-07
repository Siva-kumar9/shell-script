#!/bin/bash

USRID=$(id -u)

if [ $USRID -ne 0]
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
