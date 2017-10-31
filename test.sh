#!/bin/sh

echo "number:$#"

echo "argume:$@"
if apt-get install -y yum
  then 
     echo "ok"
  else
     echo "failed"
fi
