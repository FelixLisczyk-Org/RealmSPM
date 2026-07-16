// swift-tools-version:6.4

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260707-2135/Realm.xcframework.zip",
            checksum: "fee8742a0531528401ca8be18a522576db0f6c06fbd3dcb51de4dcecfa2a8791"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260707-2135/RealmSwift.xcframework.zip",
            checksum: "631b9e805db5b76cf877f2b4675729facc83fa2050812418ace61c48c6c5616a"
        )
    ]
)
