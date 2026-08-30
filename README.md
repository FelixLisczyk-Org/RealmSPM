This repository is used to distribute Realm binary frameworks via Swift Package Manager to other apps.

# Upgrade Realm

## Automated Workflow (Recommended)

The Realm framework distribution process is now **fully automated** using GitHub Actions.

### Quick Start

1. Go to **Actions** → **Build Realm Framework**
2. Click **"Run workflow"**
3. Enter the Realm version (e.g., `v20.0.3`)
4. Select Xcode type (Stable or Beta)
5. Click **"Run workflow"**

The workflow will automatically:
- ✅ Build frameworks from source using the selected Xcode version
- ✅ Create GitHub release with proper naming (`Realm-{version}-Swift-{swift_version}.zip`)
- ✅ Update the appropriate Swift version-specific Package manifest
- ✅ Commit changes directly to main branch
- ✅ Handle all platforms (macOS, iOS, watchOS - no tvOS per requirements)

### Workflow Details

**Input Parameters:**
- `realm_version`: Realm version to build (format: vX.Y.Z, e.g., v20.0.3)
- `use_beta_xcode`: Whether to use Beta Xcode

**Automated Steps:**
1. **Validation**: Checks version format and Xcode availability
2. **Swift Version Detection**: Automatically detects Swift version from selected Xcode
3. **Source Build**: Clones realm-swift repository and builds from source
4. **Framework Packaging**: Creates archives preserving symlinks (critical for proper linking)
5. **GitHub Release**: Publishes frameworks with computed checksums
6. **Manifest Update**: Updates the correct `Package@swift-X.Y.swift` file
7. **Direct Commit**: Commits changes directly to main branch

## Package Manifest Structure

This repository uses **Swift version-specific Package manifests** instead of conditional compilation:

- `Package@swift-6.1.swift` - For Swift 6.1
- `Package@swift-6.2.swift` - For Swift 6.2

Swift Package Manager automatically selects the appropriate manifest based on your Swift version. This approach provides cleaner separation and easier maintenance compared to conditional compilation.
