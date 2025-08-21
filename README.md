This repository is used to distribute Realm binary frameworks via Swift Package Manager to other apps.

# Upgrade Realm

## Automated Workflow (Recommended)

The Realm framework distribution process is now **fully automated** using GitHub Actions. This reduces manual work from ~30 minutes to ~5 minutes.

### Quick Start

1. Go to **Actions** → **Build and Release Realm Framework**
2. Click **"Run workflow"**
3. Enter the Realm version (e.g., `v20.0.4`)
4. Select Xcode type (Stable or Beta)
5. Click **"Run workflow"**

The workflow will automatically:
- ✅ Build frameworks from source using the selected Xcode version
- ✅ Create GitHub release with proper naming (`Realm-{version}-Swift-{swift_version}.zip`)
- ✅ Update the appropriate Swift version-specific Package manifest
- ✅ Create a pull request for review
- ✅ Handle all platforms (macOS, iOS, watchOS - no tvOS per requirements)

### Workflow Details

**Input Parameters:**
- `realm_version`: Realm version to build (format: vX.Y.Z, e.g., v20.0.4)
- `use_beta_xcode`: Whether to use Beta Xcode (required for beta Realm versions)

**Automated Steps:**
1. **Validation**: Checks version format and Xcode availability
2. **Swift Version Detection**: Automatically detects Swift version from selected Xcode
3. **Source Build**: Clones realm-swift repository and builds from source
4. **Framework Packaging**: Creates archives preserving symlinks (critical for proper linking)
5. **GitHub Release**: Publishes frameworks with computed checksums
6. **Manifest Update**: Updates the correct `Package@swift-X.Y.swift` file
7. **Pull Request**: Creates PR for review and integration

### Manual Review Process

After the workflow completes:
1. **Review the Pull Request** created by the workflow
2. **Test the frameworks** in a sample project if desired
3. **Merge the PR** to activate the new Realm version

## Legacy Manual Build Process

> ⚠️ **Deprecated**: The automated workflow above is now the recommended approach. This manual process is kept for reference and emergency situations only.

<details>
<summary>Show legacy manual process</summary>

### Precompiled Framework

1. Download latest release from [GitHub](https://github.com/realm/realm-swift/releases).
2. Run `swift package compute-checksum` on both `zip` files
3. Update archive paths and checksums in appropriate `Package@swift-X.Y.swift` file

### Manual Build

> This approach was previously required when using a beta release of Xcode. Swift module stability (`REALM_BUILD_LIBRARY_FOR_DISTRIBUTION`) is not enabled in the precompiled GitHub builds.

1. Clone Git repository and check out the latest tag. (`git clone https://github.com/realm/realm-swift.git` and `git checkout <tag>`)
2. Open `build.sh` and remove unnecessary platforms. (`PLATFORMS="${*:-osx ios watchos}"`)
3. Delete the `build` folder to clean up old artifacts.
4. Run `sh build.sh build` in the repository folder.
5. Compress both `xcframework` files in `./build/Release/`. (use Finder instead of `zip` command to preserve symlinks)
6. Run `swift package compute-checksum` on both `zip` files.
7. Upload both `zip` files to webspace.
8. Update archive paths and checksums in appropriate `Package@swift-X.Y.swift` file.

**Note:** Do not change the `REALM_BUILD_LIBRARY_FOR_DISTRIBUTION` build setting in the Realm repository. Changing this setting has previously caused problems when compiling apps with the `generic/platform=iOS Simulator` destination.

</details>

## Package Manifest Structure

This repository uses **Swift version-specific Package manifests** instead of conditional compilation:

- `Package@swift-6.1.swift` - For Swift 6.1 and earlier
- `Package@swift-6.2.swift` - For Swift 6.2 and later

Swift Package Manager automatically selects the appropriate manifest based on your Swift version. This approach provides cleaner separation and easier maintenance compared to conditional compilation.

# Resources

- https://github.com/realm/realm-swift/issues/6898#issuecomment-1679997625
- https://github.com/bioche/RealmBinaries/blob/main/README.md
- https://developer.apple.com/forums/thread/708372
- https://github.com/realm/realm-swift/issues/7258
