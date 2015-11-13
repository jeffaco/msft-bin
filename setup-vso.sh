#!/bin/bash
#Bootstrap script for getting dev environment working on Linux

#Install git first and configure it
git config --global credential.helper store
echo 'Git Configuration'
echo 'Please enter your email address:'
read email
echo 'Please enter your name:'
read name

git config --global user.email "$email"
git config --global user.name "$name"

#Now install repo and put it in the path somewhere
mkdir -p ~/bin
export PATH=~/bin:$PATH

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
