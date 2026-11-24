#!/bin/bash
# Builds DecisionTrainer and assembles a double-clickable macOS .app bundle.
# Usage: ./make-app.sh
set -euo pipefail
cd "$(dirname "$0")"

echo "==> Building in release mode…"
swift build -c release

APP="DecisionTrainer.app"
echo "==> Assembling $APP …"
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"

cp .build/release/DecisionTrainer "$APP/Contents/MacOS/DecisionTrainer"

cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>Decision Trainer</string>
    <key>CFBundleDisplayName</key>
    <string>Decision Trainer</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.decisiontrainer</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleExecutable</key>
    <string>DecisionTrainer</string>
    <key>LSMinimumSystemVersion</key>
    <string>14.0</string>
    <key>LSApplicationCategoryType</key>
    <string>public.app-category.education</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>NSPrincipalClass</key>
    <string>NSApplication</string>
</dict>
</plist>
PLIST

echo "Done: $(pwd)/$APP"
echo "Double-click it to launch, or run: open \"$APP\""
