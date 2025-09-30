#!/bin/bash

# This script is used by Vercel to build the Flutter app
# Since Vercel doesn't have Flutter, we'll use a pre-built approach

echo "Vercel build script - using pre-built Flutter web app"
echo "Make sure to run 'flutter build web --release' locally first"

# Check if build/web exists
if [ ! -d "build/web" ]; then
    echo "Error: build/web directory not found!"
    echo "Please run 'flutter build web --release' locally first"
    exit 1
fi

echo "Build directory found. Copying files..."
# The build/web directory should already exist with the built files
echo "Flutter web app is ready for deployment"
