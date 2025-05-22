#!/bin/bash

DIR=$1
ITERATIONS=1

if [ "$2" = "--debug" ]
then
  ITERATIONS=1
fi

if [ ! -d "$DIR" ]; then
  echo "Error: ${DIR} not found. Can not continue."
  exit 1
fi

rm ${DIR}/main.pdf

seq $ITERATIONS | xargs -i docker run \
                -v $(pwd)/${DIR}:/work \
                --workdir=/work \
                --rm \
                --entrypoint=xelatex \
                texlive/texlive main.tex

echo "clean up..."

# rm -f ${DIR}/*.log

find . -name \*.aux -type f -print0  | xargs -0 rm -f
find . -name \*.nav -type f -print0   | xargs -0 rm -f
find . -name \*.out -type f -print0  | xargs -0 rm -f
find . -name \*.snm -type f -print0  | xargs -0 rm -f
find . -name \*.toc -type f -print0  | xargs -0 rm -f
