#!/bin/sh

STARTDIR=$(pwd)

apk add python3 py3-pip python3-dev alpine-sdk openjdk17-jre git curl doas libc++-dev linux-headers xz openssl-dev udev libffi-dev

git clone https://github.com/guludo/venv-run.git
cd venv-run
python3 setup.py install

adduser crafty

mkdir -p /home/crafty

cd /home/crafty
git clone https://gitlab.com/crafty-controller/crafty-4.git

python3 -m venv .venv

source .venv/bin/activate
pip3 install --no-cache-dir -r crafty-4/requirements.txt

chown -R crafty:crafty /home/crafty

cd $STARTDIR

cp init-scripts/crafty /etc/init.d
rc-update add crafty

echo reboot
