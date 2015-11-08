#! /bin/bash

FILENAME=${1%.*}

if [ "$1" = "" ]; then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
elif [ "$2" = "-c" ]; then
    make ${FILENAME}
else
    make ${FILENAME} &&
    ./${FILENAME}
fi
