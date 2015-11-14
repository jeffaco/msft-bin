#! /bin/bash

cd ~/

# Don't back up stuff from git repositories (but include enough to re-seed git)

tar czvhf /tmp/base-backup.tar.gz \
    --exclude .rbenv --exclude base-backup.tar.gz --exclude dev --exclude pbuild_logs \
    --exclude bin/.git --exclude miscellaneous/.git --exclude test/.git \
    .


mv /tmp/base-backup.tar.gz ~/


#	.bash_profile .emacs .emacs-* .ssh bin Notes test

echo "Created file: base-backup.tar.gz"
