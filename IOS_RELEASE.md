# iOS Release Guide

## Overview

LNReader now supports iOS! This guide will help you understand how to install and use LNReader on your iOS device.

## System Requirements

- iOS 15.1 or higher
- iPhone or iPad

## Installation

### For Regular Users

Since LNReader is distributed outside the App Store, you'll need to:

1. **Download the IPA file** from the [releases page](https://github.com/LNReader/lnreader/releases)

2. **Install using AltStore or similar tools**:
   - [AltStore](https://altstore.io/) - Free, requires computer for weekly refresh
   - [Sideloadly](https://sideloadly.io/) - Alternative sideloading tool
   - [TrollStore](https://github.com/opa334/TrollStore) - For jailbroken devices (permanent installation)

3. **Using AltStore** (recommended for most users):
   - Install AltStore on your iOS device
   - Connect your device to your computer
   - Open AltStore and select the downloaded IPA file
   - The app will be installed on your device

### For Testers (TestFlight)

If you're part of the beta testing program:
- Accept the TestFlight invitation link
- Install TestFlight from the App Store
- Open the invitation and install LNReader

### Using Development Builds from GitHub Actions

If you want to test the latest unreleased changes:

1. **Navigate to the [Actions tab](https://github.com/LNReader/lnreader/actions/workflows/build-ios.yml)**
2. **Select a recent successful workflow run** (indicated by a green checkmark ✅)
3. **Scroll down to the "Artifacts" section** at the bottom of the page
4. **Download the IPA artifact** (named like `LNReader-iOS-r{build-number}-{commit-hash}`)
5. **Extract the ZIP file** to get the `.ipa` file
6. **Install using AltStore or Sideloadly** as described above

> **Note**: GitHub artifacts are only available for 30 days after the build and require a GitHub account to download.

## Building from Source

To build LNReader for iOS yourself:

### Prerequisites

- macOS with Xcode 14.0 or higher
- Node.js 20 or higher
- CocoaPods 1.13 or higher
- pnpm package manager

### Steps

```bash
# Clone the repository
git clone https://github.com/LNReader/lnreader.git
cd lnreader

# Install dependencies
pnpm install

# Install iOS dependencies
cd ios
bundle install
bundle exec pod install
cd ..

# Build for release
pnpm run build:release:ios
```

### Finding Your Built IPA

After building, the IPA file will be located at:
```
ios/build/LNReader.ipa
```

You can quickly open the build directory with:
```bash
pnpm run build:open-ipa
```

Or manually navigate to:
```bash
open ios/build/
```

The IPA file name will be:
- Local builds: `LNReader.ipa`
- GitHub Actions builds: `LNReader-r{commit-count}-{commit-hash}.ipa`

### Development Build

For development and testing:

```bash
# Start Metro bundler
pnpm run dev:start

# In another terminal, run on simulator
pnpm run dev:ios

# Or specify a specific simulator
pnpm run dev:ios -- --simulator="iPhone 15 Pro"
```

## Known Limitations

- **No App Store Distribution**: LNReader is not available on the App Store and must be sideloaded
- **7-Day Signing**: Free Apple Developer accounts require re-signing every 7 days
- **Enterprise Distribution**: Not currently available

## Troubleshooting

### App Crashes on Launch
- Ensure you're running iOS 15.1 or higher
- Try reinstalling the app
- Check if your signing certificate is still valid

### "Untrusted Developer" Error
1. Go to Settings > General > VPN & Device Management
2. Find the developer profile
3. Tap "Trust"

### App Won't Install
- Ensure you have enough storage space
- Check that your iOS version is compatible
- Verify the IPA file is not corrupted

## Support

For issues, questions, or feature requests:
- [GitHub Issues](https://github.com/LNReader/lnreader/issues)
- [Discord Community](https://discord.gg/QdcWN4MD63)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for development setup and guidelines.

## License

LNReader is licensed under the [MIT License](./LICENSE).
