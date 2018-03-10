#! /bin/bash

cd ~/

# Don't back up stuff from git repositories (but include enough to re-seed git)

tar czvhf /tmp/base-backup.tar.gz \
    --exclude .azure --exclude .cache --exclude .ccache --exclude .cmake \
    --exclude .config --exclude .dbus --exclude .esd_auth --exclude .gnupg \
    --exclude .ICEauthority --exclude .local --exclude .m2 --exclude .mozilla \
    --exclude .pki --exclude .pyenv --exclude .python-eggs \
    --exclude .rbenv --exclude .rbtools-cookies --exclude .rnd \
    --exclude .rpmmacros --exclude .subversion --exclude .Xauthority \
    --exclude base-backup.tar.gz \
    --exclude bin --exclude dev --exclude miscellaneous --exclude pbuild_logs \
    --exclude test --exclude .microsoft \
    .


mv /tmp/base-backup.tar.gz ~/


#	.bash_profile .emacs .emacs-* .ssh bin Notes test

echo "Created file: base-backup.tar.gz"
