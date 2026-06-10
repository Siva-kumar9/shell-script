#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs )

while read -r line
do
    echo "Lines::  " $line
done <<< $DISK_USAGE