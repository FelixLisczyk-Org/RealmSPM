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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.3-Stable-20251213-1537/Realm.xcframework.zip",
            checksum: "02a88d2f6f2dd2a5bf705c8fcb261f5320c03f3fcd6ebeda155c4126a14f24eb"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.3-Stable-20251213-1537/RealmSwift.xcframework.zip",
            checksum: "8b2eb444cb5cf485487f085c777e4ea066b68b02dc045cf56fe6d1f7b11187e6"
        )
    ]
)
