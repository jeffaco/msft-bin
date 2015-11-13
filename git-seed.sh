#! /bin/sh

cloneRepo()
{
    REPO=$1
    DIR=$2

    if [ -z "$1" -o -z "$2" ]; then
        echo "cloneRepo requires two parameters: repoName, and directory" 1>& 2
        exit 1
    fi

    if [ -d $2 ]; then
        return
    fi

    echo "========== Fetching: $1"
    git clone $1 $2
}

# Seed initial clone repositories

cloneRepo git@gitlab.com:jeffcof/msft-bin.git ~/bin
cloneRepo git@gitlab.com:jeffcof/msft-miscellaneous.git ~/miscellaneous
cloneRepo git@gitlab.com:jeffcof/msft-test.git ~/test

mkdir -p ~/dev/git
cloneRepo git@github.com:jeffaco/msft-dotfiles.git ~/dev/git/dotfiles
cloneRepo git@github.com:jeffaco/msft-updatedns.git ~/dev/git/updatedns
