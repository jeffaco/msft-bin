#! /bin/bash

cd ~/

tar czvf /tmp/base-backup.tar.gz \
    --exclude .rbenv --exclude base-backup.tar.gz --exclude dev \
    --exclude pbuild_logs --exclude Miscellaneous/archive \
    .


mv /tmp/base-backup.tar.gz ~/


#	.bash_profile .emacs .emacs-* .ssh bin Notes test

echo "Created file: base-backup.tar.gz"
