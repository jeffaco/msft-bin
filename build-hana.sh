# Build HANA project and run unit tests

if [ ! -f ./build/build.sh ]; then
    echo "ERROR: Not in correct HANA directory to build"
    exit 1
fi

set -e

echo "#################### Performing build/unit tests ####################"
./build/build.sh -K

echo
echo "#################### Running BVT tests ####################"
./bvt/hanarp/runTests.sh 
