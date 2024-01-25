#!/bin/sh

if [[ $# != 1 ]]
then

  echo "usage: install.sh <os/docker>"
  
else [[ "$1" == "alpine" ]]
  
  sh install-scripts/alpine.sh

fi

