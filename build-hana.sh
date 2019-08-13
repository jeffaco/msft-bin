#!/bin/bash

# Build HANA project and run unit tests

if [ ! -f ./build/build.sh ]; then
    echo "ERROR: Not in correct HANA directory to build"
    exit 1
fi

set -e

OS=$(uname -s)
case $OS in
    Darwin | Linux)
        ;;

    *)
        echo "Unsupported Operating System: $OS"
        exit 1
esac

if [ $# -gt 0 ]; then
    if [ $# -eq 1 -a "$1" == "--cleanup" ]; then
        echo "#################### Cleaning out Docker ####################"

        # Delete all containers
        CONTAINERS="$(docker ps -a -q)"
        [ -n "$CONTAINERS" ] && docker rm -f $CONTAINERS

        # Delete all images
        IMAGES="$(docker images -q)"
        [ -n "$IMAGES" ] && docker rmi -f $IMAGES

        echo
        exit 0
    fi

    echo "Bad parameter: Use \"--cleanup\" to clean up docker" 1 >& 2
    exit 1
fi

echo "#################### Verifying docker container ####################"
scripts/devenv.sh

case $OS in
    Darwin)
        echo
        echo "#################### Performing build/unit tests ####################"
        ./build/build.sh -S
        ;;

    Linux)
        echo
        echo "#################### Performing build/unit tests ####################"
        ./build/build.sh

        echo
        echo "#################### Running BVT tests ####################"
        ./bvt/hanarp/runTests.sh
        ;;
esac
