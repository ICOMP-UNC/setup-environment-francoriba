#!/bin/bash -e

echo ""

# Buscar el directorio "build" 
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

echo "Executing tests..."
ctest --test-dir tests -VV

echo "Executing coverage analysis..."
gcovr -r /home/franco/operativos2/setup-environment-francoriba .
