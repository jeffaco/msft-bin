#!/bin/sh

# This shell script will transfer a file to a remote system at a predefined frequency.
# This makes it useful to, say, measure disk and/or network performance on a system.
#
# To create a large file, you can use a command like:
#
#   dd if=/dev/urandom of=bigfile.dat count=10 bs=1M
#
# Modify the "count" parameter to control the overall size.  The above line will
# generate a 10MB file.
#
# This will create a file of random characters (making it unlikely that the network
# layer can significantly compress the overall network traffic).

LOOP_COUNT=3720			# Number of times to transfer file
REPEAT_SECS=60			# Frequency (in seconds) for transfer
FILE_NAME=~/bigfile.dat		# Name of the file to transfer
DEST_HOST=scxcore-rhel50-01	# Desination host to transfer file to

for i in $(seq 1 $LOOP_COUNT); do
    START_TIME=$SECONDS

    # Do the file transfer here
    scp $FILE_NAME ${DEST_HOST}:

    END_TIME=$SECONDS
    NEXT_TIME=$(($REPEAT_SECS - ($END_TIME - $START_TIME)))

    if [ $i -ne $LOOP_COUNT ]; then
	echo "[Iter: $i] Sleeping for $NEXT_TIME seconds at `date` ..."
	sleep $NEXT_TIME
    else
	echo "[Iter: $i] Completed $LOOP_COUNT iterations at `date`."
    fi
done

exit 0
