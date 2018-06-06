#!/bin/bash

# Build HANA project and run unit tests

if [ ! -f ./build/build.sh ]; then
    echo "ERROR: Not in correct HANA directory to build"
    exit 1
fi

set -e

if [ $# -gt 0 ]; then
    if [ $# -eq 1 -a "$1" == "cleanup" ]; then
	echo "#################### Cleaning out Docker ####################"

	# Delete all containers
	CONTAINERS="$(docker ps -a -q)"
	[ -n "$CONTAINERS" ] && docker rm -f $CONTAINERS

	# Delete all images
	IMAGES="$(docker images -q)"
	[ -n "$IMAGES" ] && docker rmi -f $IMAGES

	exit 0
    fi

    echo "Bad parameter: Use \"cleanup\" to clean up docker" 1 >& 2
    exit 1
fi

echo "#################### Verifying docker container ####################"
scripts/devenv.sh

echo
echo "#################### Performing build/unit tests ####################"
./build/build.sh -K

echo
echo "#################### Running BVT tests ####################"
./bvt/hanarp/runTests.sh 
