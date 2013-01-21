#!/bin/bash

while [ ! -f /usr/bin/ssh-keygen ]; do
	yaourt -S openssh
done

echo "Creating ~/.ssh"
mkdir ~/.ssh -p
cd ~/.ssh

echo "Local email?"
read sshemail
ssh-keygen -t rsa -C $sshemail
