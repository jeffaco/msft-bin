#! /bin/bash

cd ~/

# Don't back up stuff from git repositories (but include enough to re-seed git)

tar czvhf /tmp/base-backup.tar.gz \
    --exclude .rbenv --exclude base-backup.tar.gz \
    --exclude bin --exclude dev --exclude miscellaneous --exclude pbuild_logs \
    --exclude test --exclude .microsoft \
    .


mv /tmp/base-backup.tar.gz ~/


#	.bash_profile .emacs .emacs-* .ssh bin Notes test

echo "Created file: base-backup.tar.gz"
