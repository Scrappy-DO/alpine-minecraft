#!/bin/sh

if [[ $# != 1 ]]
then

  echo "usage: install.sh <os/docker>"
  
elif [[ "$1" == "alpine" ]]
  
  sh install-scripts/alpine.sh

elif [[ "$1" == "docker" ]]
  
  cd install-scripts
  docker-compose up

fi

