#!/bin/bash


# Remeber one quote is for a non interpreted string
# Two quotes if you have variables inside your string that you want to interpret

function conv {
  for file in *.pdf; do
    if [ ${file: -4} == '.pdf' ];then
      echo " Found     :  $file"
      convert -density 300 -background $1 -flatten $file ${file::-4}.png &
    fi
  done
  wait
  echo " All above files have been converted to images (.png) "
}

echo ' Before proceeding make sure that:'
echo '   ¤ all of your pdf files are in the same directory as this script '
echo '   ¤ ImageMagick is installed '


printf 'Background color for images lightblue or white [l/w]? '
read color
if [ $color = 'l' ];then
   conv lightblue 
else
   conv white
fi
