#!/bin/bash


if [ $# -ne 2 ]
then
	echo Poprawne wywołanie:
	echo $0 input.md output.pdf
	exit
fi

if [ ! -f $1 ]
then
	echo Plik nie istnieje: $INPUT
	exit
fi

INPUT="$1"
OUTPUT="$2"

pandoc  -f markdown_github+pipe_tables \
	-V papersize:A4 \
	-V margin-left:1cm \
	-V margin-right:1cm \
	-V margin-top:2cm \
	-V margin-bottom=2cm \
	-t html5 \
	--css=github-pandoc.css \
	 $INPUT \
	-o $OUTPUT

