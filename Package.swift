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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/Realm.xcframework.zip",
            checksum: "fae61b0383027acf72cd459c62f1a4cf0224fbb32bc1046c6daf094fd3906ba9"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/RealmSwift.xcframework.zip",
            checksum: "2114da0f837ab682ed70143971b4db2e9695999a2af7b7c07ade8dcaaf4c19e8"
        )
    ]
)
