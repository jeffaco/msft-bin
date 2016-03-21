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

    ~/dev/git/myrepos/mr register $2
}

# Seed initial clone repositories
# (Grab mr first so we can register everything)

export PATH=~/dev/git/myrepos:$PATH

mkdir -p ~/dev/git
cloneRepo git://myrepos.branchable.com/ ~/dev/git/myrepos
cloneRepo git@github.com:jeffaco/msft-dotfiles.git ~/dev/git/dotfiles
cloneRepo git@github.com:jeffaco/msft-updatedns.git ~/dev/git/updatedns

cloneRepo git@github.com:jeffaco/msft-bin.git ~/bin
cloneRepo git@github.com:jeffaco/msft-miscellaneous.git ~/miscellaneous
cloneRepo git@github.com:jeffaco/msft-test.git ~/test
