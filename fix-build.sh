#!/bin/bash

# Monthly Expense Tracker - Complete Fix Script
# This will fix all the build issues

echo "🔧 Fixing Monthly Expense Tracker Build Issues"
echo "=============================================="
echo ""

# Step 1: Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found"
    echo "   Run this script from the monthly-expense-tracker directory"
    exit 1
fi

echo "✅ In correct directory"
echo ""

# Step 2: Clean everything
echo "🧹 Cleaning old files..."
rm -rf node_modules package-lock.json main.js main.js.map
echo "✅ Cleaned"
echo ""

# Step 3: Install dependencies
echo "📦 Installing dependencies (this may take 2-3 minutes)..."
npm install --legacy-peer-deps 2>&1 | grep -v "deprecated" | grep -v "packages are looking" | tail -5
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed"
else
    echo "❌ Installation failed"
    echo ""
    echo "Try running manually:"
    echo "  npm install --legacy-peer-deps"
    exit 1
fi
echo ""

# Step 4: Check if obsidian module is present
echo "🔍 Checking for Obsidian API..."
if [ -d "node_modules/obsidian" ]; then
    echo "✅ Obsidian API found"
else
    echo "❌ Obsidian API missing - installing..."
    npm install --save-dev obsidian@latest --legacy-peer-deps
fi
echo ""

# Step 5: Build
echo "🏗️  Building plugin..."
npm run build 2>&1 | grep -v "deprecated" | grep -v "packages are looking" | tail -10
BUILD_EXIT=$?
echo ""

# Step 6: Check if main.js was created
if [ -f "main.js" ]; then
    SIZE=$(ls -lh main.js | awk '{print $5}')
    echo "✅ SUCCESS! main.js created (${SIZE})"
    echo ""
    echo "📋 Plugin Files Ready:"
    ls -lh main.js manifest.json styles.css 2>/dev/null | awk '{print "   " $9 " (" $5 ")"}'
    echo ""
    echo "🎉 You're ready to install in Obsidian!"
    echo ""
    echo "Next steps:"
    echo "1. Copy these 3 files to:"
    echo "   YourVault/.obsidian/plugins/monthly-expense-tracker/"
    echo ""
    echo "2. Restart Obsidian"
    echo "3. Enable plugin in Settings"
else
    echo "❌ Build failed - main.js was not created"
    echo ""
    echo "Let's check for errors:"
    echo ""
    npm run build 2>&1 | grep "error" | head -10
    echo ""
    echo "Full build log saved to: build-error.log"
    npm run build > build-error.log 2>&1
    echo ""
    echo "Please share build-error.log for help"
fi
