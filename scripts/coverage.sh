#!/bin/bash -e

echo ""

# Search for 'build' directory
if [ -d "../build" ]; then
    echo "## Found directory 'build' in $(pwd)"
    echo "## Deleting build directory..."
    rm -r ../build/*
else
    echo "## Directory 'build' not found in $(pwd)"
    echo "## Creating ../build"
    mkdir ../build
fi

echo "Compiling project with coverage flags..."
cd ../build && cmake -GNinja -DRUN_COVERAGE=1 ..

echo "Building project..."
ninja

echo "Executing coverage analysis..."
ctest -T Test -o test_report.xml --test-dir tests
gcovr -r /home/franco/operativos2/setup-environment-francoriba .
