#!/bin/bash
echo "enter verbosity"
read verbosity

if [[ $verbosity =~ "" ]] ; then
echo $verbosity
fi