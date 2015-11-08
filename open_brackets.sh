#! /bin/bash

if [ "$1" = "" ] ; then
    open -a Brackets
else
    touch $1
    open -a Brackets $1
fi
