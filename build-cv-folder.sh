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

if [ -f "${DIR}/main.pdf" ]; then
    rm "${DIR}/main.pdf"
fi

docker build -t latex-xelatex-slim .

seq $ITERATIONS | xargs -i docker run \
    -v $(pwd)/${DIR}:/work \
    --workdir=/work \
    --rm \
    latex-xelatex-slim main.tex


echo "clean up..."

# rm -f ${DIR}/*.log

find . -name \*.aux -type f -print0  | xargs -0 rm -f
find . -name \*.nav -type f -print0  | xargs -0 rm -f
find . -name \*.out -type f -print0  | xargs -0 rm -f
find . -name \*.snm -type f -print0  | xargs -0 rm -f
find . -name \*.toc -type f -print0  | xargs -0 rm -f
