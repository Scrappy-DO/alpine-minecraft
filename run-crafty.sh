#!/bin/sh

daemon() {
  cd /home/crafty/crafty-4
}

start() {
  daemon &
  $PID = $!
  echo $PID > /home/crafty/crafty.pid
}

stop() {
  kill $(cat /home/crafty/crafty.pid)
}

restart() {
  stop
  start
}

"$1"
