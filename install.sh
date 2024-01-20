#!/bin/sh

STARTDIR=$(pwd)

apk add python3 py3-pip python3-dev alpine-sdk openjdk17-jre git curl

adduser crafty

mkdir -p /home/crafty

cd /home/crafty
git https://gitlab.com/crafty-controller/crafty-4.git

mkdir server
cd server
curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.20.2/0.15.6/1.0.0/server/jar

tar xzf $STARTDIR/mods.tar.xz --directory .

cd /home/crafty
python3 -m venv .venv

source .venv/bin/activate
pip3 install --no-cache-dir -r crafty-4/requirements.txt

chown -R crafty:crafty /home/crafty

cd $STARTDIR

cp crafty /ets/init.d
rc-update add crafty

echo reboot
