#! /bin/sh

# Set up initial GIT configuration

git config --global color.ui true

git config --global core.editor "emacs -nw"
git config --global core.excludesfile ~/.gitignore

# Credential handling - may need to change
git config --global credential.helper store

# Define behavior without a refspec
git config --global push.default simple

git config --global user.name "Jeff Coffler"
git config --global user.email "jeffaco@users.noreply.github.com"

