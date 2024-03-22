#!/bin/bash -e

echo ""

# Search for 'build' directory
if [ -d "../build" ]; then
    echo "## Found directory 'build' in $(pwd)"
    echo "## Deleting contents of 'build' directory..."
    rm -r ../build/*
else
    echo "## Directory 'build' not found in $(pwd)"
    echo "## Creating directory ../build"
    mkdir ../build
fi

echo "Compiling project with test flags..."
cd ../build && cmake -GNinja -DRUN_TESTS=1 ..

echo "Building project..."
ninja

echo "Executing tests..."
ctest -T Test -o test_report.xml --test-dir tests -VV
