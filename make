#!/bin/sh
TARGET='Acrobat'
pids=(`ps -alx | grep ${TARGET} | grep -v grep | awk '{ print $2; }'`)
for pid in ${pids[*]}
  do
  kill -9 ${pid}
done

TEX='thesis.tex'
BASE=`/usr/bin/basename "$TEX" '.tex'`

LATEX='latexmk -pdf -f'
BIBTEX='bibtex'

platex $TEX
platex $TEX
dvipdfmx $BASE.dvi
#$LATEX $TEX
#$BIBTEX $BASE
#$LATEX $TEX
#$LATEX $TEX
rm ${BASE}.aux
rm ${BASE}.log
rm ${BASE}.bbl
rm ${BASE}.blg
rm ${BASE}.dvi
rm ${BASE}.fls
latexmk -c
open ${BASE}.pdf
