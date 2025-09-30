# Vercel Deployment Guide

This Flutter portfolio app is now configured for Vercel deployment using GitHub Actions.

## Files Added/Modified for Vercel:

1. **`vercel.json`** - Vercel configuration file (no build command - handled by GitHub Actions)
2. **`package.json`** - Node.js package configuration with build scripts
3. **`lib/main.dart`** - Added web-specific optimizations
4. **`test/widget_test.dart`** - Fixed test to match actual app structure
5. **`.github/workflows/deploy.yml`** - GitHub Action for building and deploying

## Deployment Steps:

### Option 1: Pre-build + Vercel Dashboard (Recommended)
1. **Build your Flutter app locally:**
   ```bash
   flutter build web --release
   ```

2. **Deploy to Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Click "New Project"
   - Import your GitHub repository
   - **Important**: Set the output directory to `build/web`
   - Deploy

### Option 2: Pre-build + Vercel CLI
1. **Build locally:**
   ```bash
   flutter build web --release
   ```

2. **Deploy with Vercel CLI:**
   ```bash
   # Install Vercel CLI
   npm i -g vercel
   
   # Deploy (make sure build/web exists)
   vercel
   ```

### Option 3: GitHub Actions + Vercel (Advanced)
1. **Set up Vercel secrets in GitHub:**
   - Go to your GitHub repo → Settings → Secrets and variables → Actions
   - Add these secrets:
     - `VERCEL_TOKEN`: Your Vercel API token
     - `ORG_ID`: Your Vercel organization ID
     - `PROJECT_ID`: Your Vercel project ID

2. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Add Vercel deployment configuration"
   git push origin main
   ```

3. **The GitHub Action will automatically:**
   - Install Flutter
   - Run tests
   - Build the web app
   - Deploy to Vercel

## Build Configuration:

- **GitHub Action**: Builds Flutter web app automatically
- **Output Directory**: `build/web`
- **Flutter Version**: 3.24.5 (stable)
- **Node Version**: >=18.0.0

## Important Notes:

- The app uses Flutter's CanvasKit renderer for better performance
- All routes are configured to serve `index.html` for SPA behavior
- Cache headers are optimized for static assets
- The app is optimized for web with proper text scaling
- GitHub Actions handles Flutter installation and building

## Getting Vercel Secrets:

1. **VERCEL_TOKEN**: 
   - Go to Vercel Dashboard → Settings → Tokens
   - Create a new token

2. **ORG_ID & PROJECT_ID**:
   - Go to your project in Vercel Dashboard
   - Check the URL or project settings

## Troubleshooting:

If you encounter issues:
1. Check GitHub Actions logs for build errors
2. Verify Vercel secrets are correctly set
3. Ensure Flutter dependencies are resolved
4. Check Vercel deployment logs

## Local Testing:

To test the built app locally:
```bash
# Build the app
flutter build web --release

# Serve the built web app
cd build/web
python -m http.server 8000
# or
npx serve build/web
```

Then visit `http://localhost:8000`
