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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Stable-20260910-0430/Realm.xcframework.zip",
            checksum: "0a5a4c9236f3f295763ace23f5ece39a11e853bce6165130d4ce4adc8e840589"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Stable-20260910-0430/RealmSwift.xcframework.zip",
            checksum: "35ae983fb1a2fca3c5ee21f7cf03cf085baa5f12ca11c3ea94c9b96b46ff05cc"
        )
    ]
)
