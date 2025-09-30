# Vercel Deployment Guide

This Flutter portfolio app is now configured for Vercel deployment.

## Files Added/Modified for Vercel:

1. **`vercel.json`** - Vercel configuration file
2. **`package.json`** - Node.js package configuration with build scripts
3. **`lib/main.dart`** - Added web-specific optimizations
4. **`test/widget_test.dart`** - Fixed test to match actual app structure

## Deployment Steps:

### Option 1: Deploy via Vercel CLI
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Follow the prompts to link your project
```

### Option 2: Deploy via GitHub Integration
1. Push your code to GitHub
2. Connect your GitHub repo to Vercel
3. Vercel will automatically detect the Flutter project and deploy

### Option 3: Deploy via Vercel Dashboard
1. Go to [vercel.com](https://vercel.com)
2. Import your GitHub repository
3. Vercel will automatically build and deploy

## Build Configuration:

- **Build Command**: `flutter build web --release`
- **Output Directory**: `build/web`
- **Node Version**: >=18.0.0

## Important Notes:

- The app uses Flutter's CanvasKit renderer for better performance
- All routes are configured to serve `index.html` for SPA behavior
- Cache headers are optimized for static assets
- The app is optimized for web with proper text scaling

## Troubleshooting:

If you encounter issues:
1. Ensure Flutter SDK is properly installed
2. Check that all dependencies are resolved
3. Verify the build output in `build/web` directory
4. Check Vercel build logs for specific errors

## Local Testing:

To test the built app locally:
```bash
# Serve the built web app
cd build/web
python -m http.server 8000
# or
npx serve build/web
```

Then visit `http://localhost:8000`
