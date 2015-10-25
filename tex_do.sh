#! /bin/bash

check_one_more() {
    LOGFILE=./${FILENAME}.log
    while read text; do
        if [ "$text" = "LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right." ]
        then
            echo 1
            return 1
        fi
    done < $LOGFILE

    echo 0
    return 0
}

if [ "$1" = "" ]
then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
fi

FILENAME=${1%.*}

one_more=1
until [ $one_more -eq 0 ]
do
    platex --kanji=utf8 ${FILENAME}.tex
    one_more=`check_one_more`
done

dvipdfmx -d5 ${FILENAME}.dvi &&
open ${FILENAME}.pdf

if [ "$2" = "-d" ]
then
    rm ${FILENAME}.aux
    rm ${FILENAME}.dvi
    rm ${FILENAME}.log
fi
