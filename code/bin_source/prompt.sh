#!/bin/sh

CWD_PATH=$(echo ${PWD} | sed 's@'"${HOME}"'@~@')
FOLDER=${CWD_PATH##*/}
CWD_PATH=${CWD_PATH%"$FOLDER"}
CWD_TOKENS=$(echo $CWD_PATH | tr "/" "\n")

for token in $CWD_TOKENS
do
  if [ ${token::1} == "." ];
  then echo -n "/${token:0:2}";
  else echo -n "/${token::1}";
  fi 
done
echo -n "/$FOLDER"
