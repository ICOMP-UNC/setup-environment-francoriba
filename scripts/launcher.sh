#!/bin/bash

echo "## Apply lang-format -style=Microsoft -i to sources and header files"
clang-format -style=Microsoft -i ../include/*
clang-format -style=Microsoft -i ../src/*
clang-format -style=Microsoft -i ../lib/dynamiclib/include*
clang-format -style=Microsoft -i ../lib/dynamiclib/src*
clang-format -style=Microsoft -i ../lib/staticlib/include*
clang-format -style=Microsoft -i ../lib/staticlib/src*

echo ""

# Search for 'build' directory
if [ -d "../build" ]; then
    echo "## Found directory 'build' in $(pwd)"
    echo "## Deleting contents of 'build' directory..."
    rm -r ../build/*
else
    echo "## Directoy 'build' not found in $(pwd)"
    echo "## Creating directory ../build"
    mkdir ../build
fi

echo ""

# Build the project
echo "## cd build"
cd ../build && cmake -GNinja .. && ninja

echo ""

# Execute the project
echo "## ./so2_lab0"
./so2_lab0

# Delete the build directory
rm -r ../build
