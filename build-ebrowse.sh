#!/bin/sh

# Set base directory
cd ~/dev/a

# Clean up old files
rm -f FILES BROWSE

# Build new list of files to include
find source	-wholename source/ext -prune -o -name \*.h -print > FILES
find test	-name \*.h -print >> FILES

find source	-wholename source/ext -prune -o -name \*.c -print >> FILES
find test	-name \*.c -print >> FILES

find source	-wholename source/ext -prune -o -name \*.cpp -print >> FILES
find test	-name \*.cpp -print >> FILES

# Build the browse database
ebrowse --files=FILES
