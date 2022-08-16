#!/bin/bash
echo "Hello there!"
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo $version
echo "Enter 1 to continue or 0 to exit."
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for file in source/*
  do
    echo $file
    if [ "$file" == "source/secretinfo.md" ]
    then
      echo "File secretinfo.md will not be copied."
    else
      echo "The file is being copied."
      cp $file build/.
    fi
  done
else
  "Please come back when you are ready."
fi

cd build
cd ..
