#!/bin/bash

echo "Building Flutter web app..."
flutter build web --release

echo "Build completed! The app is ready in build/web/"
echo "You can now deploy the build/web folder to Vercel"
