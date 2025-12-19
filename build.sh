#!/usr/bin/env bash
# Build and package Stillwater

set -e

echo "Building Stillwater..."

echo "Copying files to stillwater/..."
mkdir -p stillwater && cp -R assets stillwater/assets && cp src/*.wisp stillwater

echo ""
echo "Build complete!"
echo ""
echo "Files in stillwater/:"
ls -la stillwater/
