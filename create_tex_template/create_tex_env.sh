#! /bin/bash

if [ "$1" = "" ]; then
    echo "No argument!!"
    echo "Please enter some argument!!"
    exit
fi

FOLDERNAME=${1%.*}

mkdir ${FOLDERNAME}
cd ${FOLDERNAME}
touch main.tex
mkdir programs images text

cp -R ~/.scripts/create_tex_template/tex_template `pwd`
cp `pwd`/tex_template/template.tex `pwd`/main.tex
rm `pwd`/tex_template/template.tex
