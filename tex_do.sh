#! /bin/bash

FILENAME=${1%.*}
LOGFILE=./${FILENAME}.log

function has_error() {
    while read text
    do
        if [[ "$text" =~ ^\? ]] || [[ "$text" =~ ^\! ]]; then
            return 0
            exit
        fi
    done < $LOGFILE

    return 1
    exit
}

function has_warning() {
    while read text
    do
        if [[ "$text" =~ ^Warning ]]; then
            return 0
            exit
        fi
    done < $LOGFILE

    return 1
    exit
}

function needs_compile() {
    warning_of_label="LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right."

    while read text
    do
        if [ "$text" = "$warning_of_label" ]; then
            return 0
            exit
        fi
    done < $LOGFILE

    return 1
    exit
}

function platex_compile() {
    yes x | platex --kanji=utf8 ${FILENAME}.tex
}

function remove_intermediate_files() {
    rm ${FILENAME}.aux
    rm ${FILENAME}.dvi
    rm ${FILENAME}.log
}

if [ "$1" = "" ]; then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
fi

platex_compile

if has_error; then
    echo "Some error occurred!!"
    exit
fi

while needs_compile
do
    echo -e "\nIt will compile again."
    platex_compile
done

if [ "$2" = "--severe" ] && has_warning; then
    echo "Some warning occurred!!"
    exit
fi

dvipdfmx -d5 ${FILENAME}.dvi &&
open ${FILENAME}.pdf

if [ "$2" = "--clean" ]; then
    echo "Delete intermediate files. ($1.aux, $1.dvi, $1.log)"
    remove_intermediate_files
fi
