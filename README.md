This repository is used to distribute Realm binary frameworks via Swift Package Manager to other apps.

# Upgrade Realm

## Precompiled Framework

1. Download latest release from [GitHub](https://github.com/realm/realm-swift/releases).
2. Run `swift package compute-checksum` on both `zip` files
3. Update archive paths and checksums in `Package.swift`

## Manual Build

> This apporach is required when using a beta release of Xcode. Swift module stability (`REALM_BUILD_LIBRARY_FOR_DISTRIBUTION`) is not enabled in the precompiled GitHub builds.

1. Clone Git repository and check out the latest tag. (`git clone https://github.com/realm/realm-swift.git` and `git checkout <tag>`)
2. Open `Configuration/RealmSwift/RealmSwift.xcconfig` and set `REALM_BUILD_LIBRARY_FOR_DISTRIBUTION` to `YES`. This ensures that the framework can be built with future versions of the Swift compiler. (The pre-built binaries don't have this flag enabled.)
3. Open `build.sh` and remove unnecessary platforms. (`PLATFORMS="${*:-osx ios watchos}"`)
4. Run `sh build.sh build` in the repository folder.
5. Compress both `xcframework` files in `./build/Release/`
6. Run `swift package compute-checksum` on both `zip` files
7. Upload both `zip` files to webspace
8. Update archive paths and checksums in `Package.swift`

# Resources

- https://github.com/realm/realm-swift/issues/6898#issuecomment-1679997625
- https://github.com/bioche/RealmBinaries/blob/main/README.md
- https://developer.apple.com/forums/thread/708372
- https://github.com/realm/realm-swift/issues/7258
