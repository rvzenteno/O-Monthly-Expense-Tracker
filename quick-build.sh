#!/bin/bash

# Quick Build - Bypasses strict TypeScript checking
# Use this if the normal build is failing due to type errors

echo "🚀 Quick Build (bypassing strict type checks)"
echo "=============================================="
echo ""

# Check directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Run from monthly-expense-tracker directory"
    exit 1
fi

# Use esbuild directly without TypeScript checking
echo "📦 Building with esbuild (no type checking)..."

npx esbuild main.ts \
  --bundle \
  --external:obsidian \
  --external:electron \
  --external:@codemirror/autocomplete \
  --external:@codemirror/collab \
  --external:@codemirror/commands \
  --external:@codemirror/language \
  --external:@codemirror/lint \
  --external:@codemirror/search \
  --external:@codemirror/state \
  --external:@codemirror/view \
  --external:@lezer/common \
  --external:@lezer/highlight \
  --external:@lezer/lr \
  --format=cjs \
  --target=es2018 \
  --outfile=main.js \
  --platform=node \
  --sourcemap=inline

BUILD_EXIT=$?

if [ $BUILD_EXIT -eq 0 ] && [ -f "main.js" ]; then
    SIZE=$(ls -lh main.js | awk '{print $5}')
    echo ""
    echo "✅ SUCCESS! main.js created (${SIZE})"
    echo ""
    echo "📋 Ready to install:"
    ls -lh main.js manifest.json styles.css 2>/dev/null
    echo ""
    echo "🎉 Copy these files to Obsidian!"
else
    echo ""
    echo "❌ Build failed"
    echo ""
    echo "Try this:"
    echo "  npm install --legacy-peer-deps"
    echo "  bash quick-build.sh"
fi
