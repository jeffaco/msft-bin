#! /bin/bash

cloneRepo()
{
    REPO=$1
    DIR=$2

    if [ -z "$1" -o -z "$2" ]; then
        echo "cloneRepo requires two parameters: repoName, and directory" 1>& 2
        exit 1
    fi

    if [ ! -d $2 ]; then
        echo "========== Fetching: $1"
        git clone $1 $2
    else
        echo "========== Registering: $1"
    fi

    ~/dev/myrepos/mr register $2
}

# Seed initial clone repositories
# (Grab mr first so we can register everything)

export PATH=~/dev/myrepos:$PATH

mkdir -p ~/dev
cloneRepo git://myrepos.branchable.com/ ~/dev/myrepos
cloneRepo git@github.com:jeffaco/msft-dotfiles.git ~/dev/dotfiles

cloneRepo git@github.com:jeffaco/msft-bin.git ~/bin
#cloneRepo git@github.com:jeffaco/msft-miscellaneous.git ~/miscellaneous
#cloneRepo git@github.com:jeffaco/msft-test.git ~/test
