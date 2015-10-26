#! /bin/bash

check_compile() {
    LOGFILE=./${FILENAME}.log
    while read text
    do
        if [ "$text" = "LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right." ]; then
            echo 1
            exit
        fi
    done < $LOGFILE

    echo 0
    exit
}

if [ "$1" = "" ]; then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
fi

FILENAME=${1%.*}

is_compile=1
until [ $is_compile -eq 0 ]
do
    platex --kanji=utf8 ${FILENAME}.tex
    is_compile=`check_compile`
done

dvipdfmx -d5 ${FILENAME}.dvi &&
open ${FILENAME}.pdf

if [ "$2" = "-d" ]; then
    rm ${FILENAME}.aux
    rm ${FILENAME}.dvi
    rm ${FILENAME}.log
fi
