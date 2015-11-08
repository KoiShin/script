#! /bin/bash

if [ "$1" = "" ]
then
    echo "No argument!!"
    echo "Please enter some argument"
    exit
fi

FILENAME=${1%.*}

echo -e "Compiling...\n"
javac ${FILENAME}.java &&
java ${FILENAME}
