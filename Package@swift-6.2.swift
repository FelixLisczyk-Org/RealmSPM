// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]
        ),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Realm",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta-20250822-1931/Realm.xcframework.zip",
            checksum: "2658b91fc1ac5f17ca44ad9b02846b27eee2e7981355ae07203466d40ac4b841"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta-20250822-1931/RealmSwift.xcframework.zip",
            checksum: "b48e5a13c0d133acafc68c8ac5587599990047c384d530ec798ce40ff4d6b31c"
        )
    ]
)
