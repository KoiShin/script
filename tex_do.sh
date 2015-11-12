#! /bin/bash

FILENAME=${1%.*}
LOGFILE=./${FILENAME}.log

function has_error() {
    while read text
    do
        if [[ "$text" =~ ^\? ]]; then
            return 0
            exit
        fi
    done < $LOGFILE

    return 1
    exit
}

export warning="LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right."
function needs_compile() {
    while read text
    do
        if [ "$text" = "$warning" ]; then
            return 0
            exit
        fi
    done < $LOGFILE

    return 1
    exit
}

function platex_compile() {
    platex --kanji=utf8 ${FILENAME}.tex
}

if [ "$1" = "" ]; then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
fi


platex_compile
if has_error; then
    exit
fi

while needs_compile
do
    platex_compile
done

dvipdfmx -d5 ${FILENAME}.dvi &&
open ${FILENAME}.pdf

if [ "$2" = "clean" ]; then
    rm ${FILENAME}.aux
    rm ${FILENAME}.dvi
    rm ${FILENAME}.log
fi
