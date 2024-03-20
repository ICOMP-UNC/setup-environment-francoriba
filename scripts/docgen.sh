#!/bin/bash -e

echo ""

# Search for 'docs' directory
if [ -d "../docs" ]; then
    echo "## Found 'docs' in $(pwd)"
    echo "Creating documentation..."
    # Delete 'html' directory if it already exists
    if [ -d "../docs/html" ]; then
        echo "## Directory 'html' already exists in ../docs"
        echo "## Deleting 'html' directory..."
        rm -rf ../docs/html
    fi
    cd ../docs
    echo "Running doxygen..."
    doxygen Doxyfile
    echo "Documentation generated in ../docs/html"

else
    echo "## Direcroty 'docs' not found"
    echo "## Creating directory 'docs' in ../docs"
    mkdir ../docs && cd ../docs
    echo "Creating Doxyfile..."
    doxygen -g
    exit 1
fi
