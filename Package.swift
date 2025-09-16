// swift-tools-version:6.1

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Stable-20250916-1458/Realm.xcframework.zip",
            checksum: "aa9c5c88ae220cc5a3ef3f74879d7c88f0a5b439cf6c78ffff155f1fe04b8434"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Stable-20250916-1458/RealmSwift.xcframework.zip",
            checksum: "9b40265578b5be2506df505bbb133b728391246ae3f16d502e4912840564195f"
        )
    ]
)
