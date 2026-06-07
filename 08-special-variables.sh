#!/bin/bash

echo "All Variable : $@"
echo "No Of Variables $#: 
echo "Script name : $0"
echo "PWD: $PWD"
echo "Home Directory : $HOME"
echo "Which User is Running : $USER"
echo "Process id of current Script :$$ "
sleep 60 &
echo "Process id of last command : $! "