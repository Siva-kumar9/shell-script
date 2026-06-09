#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}


LOG_FOLDER="/home/ec2-user/shellscript-logs"
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

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <Source> <Desti> <DAYS Optional> "
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi


if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR  $R Doesn't exit ... $N Please Check"
    exit 1
fi


if [ ! -d $DESTINATION_DIR ]
then
    echo -e "$DESTINATION_DIR  $R Doesn't exit ... $N Please Check"
    exit 1
fi

FILE=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if[ -n "$FILE" ]
then
    echo "Files are :: $FILE"
else
    echo "Files Olders than $DAYS Not Found...."
fi