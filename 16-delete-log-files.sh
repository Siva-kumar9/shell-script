#!/bin/bash

USRID=$(id -u)

CHECKROOT()
{
    if [ $USRID -ne 0 ]
    then
    echo -e " $R Not a Root User"
    exit 1
    fi
}


SOURCE_DIR="/home/ec2-user/app-logs"
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
        echo -e "$2 iS $R Fail $N"
        exit 1
    else
        echo -e "$2 is $G Success $N"
    fi
}

echo "Time of Execution is : $TIMESTAMP "  &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to delete : $FILES_TO_DELETE"

while read -r file
do
    echo "Deleting Files"
    rm -rf $file
done <<< $FILES_TO_DELETE