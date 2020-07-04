#!/bin/sh

#find . -name '*.xml' -exec pandoc -f docbook -t asciidoc {} -o \;
#find . -name '*.xml' -exec echo $(basename {}) \;
#find . -name '*.xml' -exec bash -c 'echo $(basename $1)' - '{}'\;

for f in $(find . -name '*.xml'); do
  pandoc -f docbook -t gfm $f -o "${f%.*}.md"

done
