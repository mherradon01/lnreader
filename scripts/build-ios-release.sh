#!/bin/bash
set -e

echo "Building iOS Release..."

# Navigate to iOS directory
cd ios

# Build archive
echo "Creating archive..."
xcodebuild -workspace LNReader.xcworkspace \
  -scheme LNReader \
  -configuration Release \
  -destination generic/platform=iOS \
  -archivePath build/LNReader.xcarchive \
  archive \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGNING_ALLOWED=NO

# Create IPA from archive
echo "Creating IPA..."
mkdir -p build/Payload
cp -R build/LNReader.xcarchive/Products/Applications/LNReader.app build/Payload/

# Get commit info for naming
if [ -n "$COMMIT_COUNT" ] && [ -n "$COMMIT_ID" ]; then
  IPA_NAME="LNReader-r${COMMIT_COUNT}-${COMMIT_ID}.ipa"
else
  IPA_NAME="LNReader.ipa"
fi

cd build
zip -r "$IPA_NAME" Payload
cd ..

echo "iOS build complete: ios/build/$IPA_NAME"
